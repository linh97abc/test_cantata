/*****************************************************************************/
/*                                                                           */
/*                       Cantata User Guide Example                          */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* Example  : Stack (C++)                                                    */
/*                                                                           */
/* Filename : stack.cpp                                                      */
/*                                                                           */
/*****************************************************************************/

#include "stack.h"

/*
 *  Default constructor
 */
Stack::Stack()
{
    head = NULL;
}

/*
 * Copy constructor
 */
Stack::Stack(const Stack& stack)
{
    head = NULL;
 
    node* stack_ptr = stack.head;
    while (stack_ptr != NULL)
    {
        push(0);
        stack_ptr = stack_ptr->next;
    }
 
    stack_ptr = stack.head;
 
    node* copy_ptr = stack.head;
    while (copy_ptr != NULL)
    {
        copy_ptr->data = stack_ptr->data;
        stack_ptr = stack_ptr->next;
        copy_ptr = copy_ptr->next;
    }
}

/*
 * Check if Stack is empty
 */
bool Stack::is_empty()
{
    return (head == NULL);
}

/*
 * Push function
 */
void Stack::push(int value)
{
    node* new_head = NULL;

    try
    {
        new_head = new node;

        new_head->next = head;
        new_head->data = value;
        head = new_head;
    }
    catch (std::bad_alloc)
    {
        throw Stack::new_error();
    } 

    return;
}

/*
 * Pop function
 */
int Stack::pop()
{
    if (is_empty())
    {
        throw Stack::empty_pop();
    }

    int ret_val = head->data;
    node* new_head = head->next;
    delete head;
    head = new_head;

    return ret_val;
}
