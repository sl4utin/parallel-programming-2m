import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class MySemaphore extends Semaphore {

    private final ReentrantLock lock = new ReentrantLock();
    private final Condition permitsAvailable = lock.newCondition();
    private int permits;

    public MySemaphore(int initialPermits) {
        super(initialPermits); // для совместимости
        this.permits = initialPermits;
    }

    @Override
    public void acquire() throws InterruptedException {
        lock.lock();
        try {
            while (permits <= 0) {
                permitsAvailable.await(); // ждём доступного разрешения
            }
            permits--; // получаем разрешение
        } finally {
            lock.unlock();
        }
    }

    @Override
    public void release() {
        lock.lock();
        try {
            permits++; // возвращаем разрешение
            permitsAvailable.signal(); // будим один поток
        } finally {
            lock.unlock();
        }
    }

    @Override
    public int availablePermits() {
        return permits;
    }
}