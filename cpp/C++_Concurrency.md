# C++ Concurrency

> C++ 并发编程 

## 开始入门

启动一个独立的线程来打印信息。

```cpp
#include <iostream>
#include <thread>

void hello()
{
    std::cout << "Hello,World!" << std::endl;
}

int main()
{
    std::thread t(hello);
    t.join();
    return 0;
}
```

标准C++库中对多线程的支持在`<thread>`头文件中声明，而保护共享数据的函数和类在其他头文件中声明。

## 线程管理

每个程序至少有一个线程，执行main函数的线程，其余线程有各自的入口函数。

线程与原始线程同时运行，当线程执行完入口函数后，线程也会退出。

使用C++线程启动线程，可以归结为构造`std::thread`对象

```cpp
void job() {
    // do some work
}
std::thread t(job);
```

使用lambda表达式

```cpp
std::thread t([]{
    job1();
    job2();
});
```

如果需要等待线程，相关的`std::thread`实例需要使用`join()`

使用`detach()`会让线程在后台运行，这就意味着主线程不能与之产生直接交互。

通常分离线程为守护线程，这种线程的特点就是长时间运行。

线程标识类型是`std::thread::id`，可以通过两种方式进行检索。

第一种：调用`std::thread`对象的成员函数`get_id()`

第二种：当前线程中调用`std::this_thread::get_id()`

## 线程间共享数据

保护共享数据的最基本方式，是使用C++标准库提供的互斥量。

C++中通过实例化`std::mutex`创建互斥量，通过调用成员函数lock()进行上锁，调用unlock()进行解锁。

一个给定操作需要两个或两个以上的互斥量时，另一个潜在的问题是死锁。与条件竞争完全相反——不同的两个线程会相互等待，从而什么都没做。

`std::lock`可以一次性锁住多个（两个以上）的互斥量，并且没有副作用（死锁风险）。

避免死锁的建议：

- 避免嵌套锁
- 避免在持有锁时调用用户提供的代码
- 使用固定顺序获取锁
- 使用锁的层次结构



## 参考资料

[http://shouce.jb51.net/cpp_concurrency_in_action/](http://shouce.jb51.net/cpp_concurrency_in_action/)