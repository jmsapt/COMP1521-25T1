// A)
struct _coord {
    // 0x00
    double x;
    // 0x08
    double y;
    // 0x10
    // ...
};

// B)
typedef struct _node Node;
struct _node {
    // 0x00
    int value;
    // 0x04
    Node *next;
    // 0x08
    // ...
};

// C)
struct _enrolment {
    // 0x00
    int stu_id;         // e.g. 5012345
    // 0x04
    char course[9];     // e.g. "COMP1521"
    // 0x0C
    char term[5];       // e.g. "17s2"
    // 0x12
    char grade[3];      // e.g. "HD"
    // 0x15
    // padding (3bytes)
    // 0x18
    double mark;        // e.g. 87.3
};

// D)
typedef char Item;
struct _queue {
    // 0x00
    int nitems;     // # items currently in queue
    // 0x04
    int head;       // index of oldest item added
    // 0x08
    int tail;       // index of most recent item added
    // 0x0B
    int maxitems;   // size of array
    // 0x10
    Item *items;    // malloc'd array of Items
    // 0x14
    // ...
};

// Bonus!
struct _bonus {
    char a;
    char c;
    // 2 bytes
    int b;
};
