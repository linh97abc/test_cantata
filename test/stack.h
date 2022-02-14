/*****************************************************************************/
/*                                                                           */
/*                       Cantata User Guide Example                          */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* Example  : Stack (C++)                                                    */
/*                                                                           */
/* Filename : stack.h                                                        */
/*                                                                           */
/*****************************************************************************/         

#include <new>

#define NULL 0

class Stack
{
public:
    Stack();                    // create empty Stack
    Stack(const Stack&);        // create copy of Stack
    bool is_empty();            // return true if Stack is empty
    virtual void push(int);     // push an integer onto the Stack
    int pop();                  // pop the top integer from the Stack

    struct new_error {};        // exception if new cannot allocate memory
    struct empty_pop {};        // exception if pop from an empty Stack

protected:
    struct node                 // node to store data
    {
        int   data;
        node* next;
    };
    node* head;                 // head of Stack pointer
};

