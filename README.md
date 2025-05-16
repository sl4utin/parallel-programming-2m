## Лабораторная работа №1

1) Была написана программа, выполняющая перемножение массива из 4х чисел размером 32 бита при помощи SSE инструкций. 
(10000000 параллельных итераций за 8.541 мс.)
2) Была написана программа, выполняющая эти действия последовательно.
(10000000 последовательных итераций за 41.401 мс.)
3) В результате сравнения производительности было выявлено, что программа использующая SSE инструкции выполняется в 4.5 раза быстрее.
4) В сгенерированном коде ассемблера можно видеть что, операции, которые прописаны с помощью SSE были вставлены в код ассемблера, а прописанная последовательно операция умножения, была улучшена.


## Лабораторная работа №2

1) Была написана программа, которая используется pthreads, создавая многопоточное вычисление задачи.
(10 потоков за 395.812 мс.)
2) Была написана программа, выполняющая вычисление задачи последовательно.
(10 последовательных потоков за 3618.464 мс.)
3) При сравнении производительности выяснилось что программа, использующая Pthreads, выполняется быстрее в 9 раз, чем та, что делает это последовательно.


## Лабораторная работа №3

1) Была написана программа, при помощи OpenMP, которая создаёт n потоков, создавая многопоточное вычисление задачи.
(10 потоков за 387.244 мс.)
2) При сравнении производительности выяснилось что программа, использующая OpenMP, выполняется чуть быстрее в 9.3 раз, чем та, что делает это последовательно, а также чуть быстрее чем та, что использует Pthreads.


## Лабораторная работа №4

Были рассмотрены 4 коллекции. Использовалось 50 потоков.

При работе с HashMap случались ошибки, связанные с конкурентным доступом к определенным ресурсам

Hashtable уже является потокобезопасной коллекцией и может обеспечить корректный результат при конкурентном доступе к бакетам.

Collections.synchronizedMap также является потокобезопасной коллекцией и может обеспечить корректный результат при конкурентном доступе.

ConcurrentHashMap также является потокобезопасной коллекцией и может обеспечить корректный результат при конкурентном доступе.

Также было произведено сравнение времени выполнения кода при использовании различных коллекций и кол-во ошибках при их работе:
Collections:
	java.util.HashMap...done. Errors: 89
	java.util.Hashtable...done. Errors: 0
	java.util.Collections$SynchronizedMap...done. Errors: 0
	java.util.concurrent.ConcurrentHashMap...done. Errors: 0
Execution times:
	HashMap: 0,067 s,
	HashTable: 0,270 s,
	SyncMap: 0,153 s,
	ConcurrentHashMap: 0,014 s.

Как видно из результатов, HashMap не стоит использовать, когда необходима коллекция, к которой будет конкурентный доступ. Наиболее быстрой и при этом безопасной коллекцией является ConcurrentHashMap. Связано это с тем, что в отличие от HashTable и synchronizedMap, которые блокируются полностью при доступе к ним, в ConcurrentHashMap блокируются лишь отдельные бакеты, что позволяет другим потокам в это время вести работу с другими бакетами.


## Лабораторная работа №5

Создана реализации семафора коллекции - с применением ReentrantLock и с применением мониторов (synchronized методов). Использовалось 7 потоков, а вместимость семафора была задана равной 3.

Результат работы программы:

Regular semaphore:
Поток pool-1-thread-1 работает. Активных потоков: 1
Поток pool-1-thread-2 работает. Активных потоков: 2
Поток pool-1-thread-3 работает. Активных потоков: 3
Поток pool-1-thread-5 работает. Активных потоков: 1
Поток pool-1-thread-6 работает. Активных потоков: 3
Поток pool-1-thread-4 работает. Активных потоков: 2
Поток pool-1-thread-7 работает. Активных потоков: 1
Максимальное количество активных потоков: 3

My semaphore:
Поток pool-2-thread-1 работает. Активных потоков: 1
Поток pool-2-thread-3 работает. Активных потоков: 3
Поток pool-2-thread-2 работает. Активных потоков: 2
Поток pool-2-thread-4 работает. Активных потоков: 1
Поток pool-2-thread-6 работает. Активных потоков: 3
Поток pool-2-thread-5 работает. Активных потоков: 2
Поток pool-2-thread-7 работает. Активных потоков: 3
Максимальное количество активных потоков: 3

Как видно из результатов, оба семафора работают корректно и обеспечивают ограничение на максимальное количество активных потоков.


## Лабораторная работа №6

В рамках задачи выполнялось ознакомление и работа с Java IPC. Созданы клиент и сервер, которые обмениваются между собой сообщениями через socket.

Результат работы программы сервера:
Server is running and waiting for connections...
New client connected: Socket[addr=/127.0.0.1,port=53527,localport=12345]
New client connected: Socket[addr=/127.0.0.1,port=53533,localport=12345]
User Максим connected.
User Точно не Максим connected.
[Максим]: Здорова
[Точно не Максим]: Привет

Результат работы программы клиента-1:
Connected to the chat server!
Enter your username:
Максим
Welcome to the chat, Максим!
Type Your Message
Здорова
[Точно не Максим]: Привет

Результат работы программы клиента-2:
Connected to the chat server!
Enter your username:
Точно не Максим
Welcome to the chat, Точно не Максим!
Type Your Message
[Максим]: Здорова
Привет

Как видно из результатов, процессы-клиенты и сервер взаимодействуют корректно, выводя сообщения.


## Лабораторная работа №7

cd ./Mappedbus-master
java --add-exports -cp "out" io.mappedbus.sample.object.ObjectReader
java --add-exports -cp "out" io.mappedbus.sample.object.ObjectWriter 0
java --add-exports -cp "out" io.mappedbus.sample.object.ObjectWriter 1

Запускается 2 ObjectWriter, которые пишут данные в memory mapped файл. После этого запускается ObjectReader, считывающий данные из этого файла, при этом выводя данные в консоль:
Read: PriceUpdate [source=0, price=146, quantity=292], hasRecovered=true
Read: PriceUpdate [source=1, price=136, quantity=272], hasRecovered=true
Read: PriceUpdate [source=0, price=148, quantity=296], hasRecovered=true
Read: PriceUpdate [source=1, price=138, quantity=276], hasRecovered=true
Read: PriceUpdate [source=0, price=150, quantity=300], hasRecovered=true
Read: PriceUpdate [source=1, price=140, quantity=280], hasRecovered=true
Read: PriceUpdate [source=0, price=152, quantity=304], hasRecovered=true
Read: PriceUpdate [source=1, price=142, quantity=284], hasRecovered=true
Read: PriceUpdate [source=0, price=154, quantity=308], hasRecovered=true
Read: PriceUpdate [source=1, price=144, quantity=288], hasRecovered=true
Read: PriceUpdate [source=0, price=156, quantity=312], hasRecovered=true
Read: PriceUpdate [source=1, price=146, quantity=292], hasRecovered=true


Как видно, считываются одновременно 2 различных источника. При этом если остановить один процесс ObjectWriter, то записывать будет уже один источник:
Read: PriceUpdate [source=1, price=196, quantity=392], hasRecovered=true
Read: PriceUpdate [source=1, price=198, quantity=396], hasRecovered=true
Read: PriceUpdate [source=1, price=200, quantity=400], hasRecovered=true
Read: PriceUpdate [source=1, price=202, quantity=404], hasRecovered=true
Read: PriceUpdate [source=1, price=204, quantity=408], hasRecovered=true
Read: PriceUpdate [source=1, price=206, quantity=412], hasRecovered=true
Read: PriceUpdate [source=1, price=208, quantity=416], hasRecovered=true
