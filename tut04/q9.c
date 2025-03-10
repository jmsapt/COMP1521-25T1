#include <stdlib.h>

typedef struct _node Node;
struct _node { int value; Node *next; };

int max (Node *list)
{
    if (list == NULL) return -1;
    int max = list->value;
    Node *curr = list;
    while (curr != NULL) {
        if (curr->value > max)
            max = curr->value;
        curr = curr->next;
    }
    return max;
}
