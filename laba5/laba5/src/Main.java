import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {

    public static final int THREADS = 8;
    public static final int COUNT = 2;
    public static MySemaphore mySemaphore = new MySemaphore(COUNT);
    public static Semaphore regularSemaphore = new Semaphore(COUNT);
    private static final AtomicInteger activeThreads = new AtomicInteger(0);
    private static final AtomicInteger maxActiveThreads = new AtomicInteger(0);

    public static void main(String[] args) {
        System.out.println("-------------------\nRegular semaphore:\n-------------------");
        runTask(regularSemaphore);
        System.out.println("--------------\nMy semaphore:\n--------------");
        runTask(mySemaphore);
    }

    private static void runTask(Semaphore semaphore) {
        ExecutorService es = Executors.newFixedThreadPool(THREADS);
        List<Callable<String>> tasks = new ArrayList<>();

        for (int i = 0; i < THREADS; i++) {
            tasks.add(() -> {
                String threadName = Thread.currentThread().getName();
                semaphore.acquire(); // поток ждёт, если разрешения нет

                try {
                    int currentActive = activeThreads.incrementAndGet();
                    maxActiveThreads.updateAndGet(prev -> Math.max(prev, currentActive));

                    System.out.println("Поток " + threadName + " работает. Активных потоков: " + currentActive);
                    Thread.sleep(1000); // эмуляция работы

                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                } finally {
                    activeThreads.decrementAndGet();
                    semaphore.release(); // освобождаем разрешение
                }

                return "Thread " + threadName + " done";
            });
        }

        try {
            List<Future<String>> results = es.invokeAll(tasks);
            for (Future<String> result : results) {
                System.out.println(result.get());
            }
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        } finally {
            es.shutdown();
        }

        System.out.println("Максимальное количество активных потоков: " + maxActiveThreads.get());
        System.out.println();
        activeThreads.set(0);
        maxActiveThreads.set(0);
    }
}