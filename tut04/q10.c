int nitems = 0;
int head = 0;
int tail = 0;
int size = 8;
int queue[8];

// place item at the tail of the queue
// if queue is full, returns -1; otherwise returns 0
int enqueue (int item)
{
    if (nitems == 8) return -1;
    if (nitems  > 0) tail = (tail + 1) % 8;
    queue[tail] = item;
    nitems++;
    return 0;
}

// remove item from head of queue
// if queue is empty, returns -1; otherwise returns removed value
int dequeue (void)
{
    if (nitems == 0) return -1;
    int res = queue[head];
    if (nitems  > 1) head = (head + 1) % 8;
    nitems--;
    return res;
}
