.data
question:  .asciiz "Insira um valor para a ordem da matriz quadrada: "

.data
n:      .word   3     # Initialize 'n' with a default value

# Define the matrix size and a pointer to the matrix
.data
matrix_size: .word 0   # To store the size of the matrix
matrix_ptr:  .word 0   # To store the pointer to the matrix

.text
main:
        # Display the question to the user
        la      a0, question
        ecall

        # Read the matrix size from the user
        li      a7, 5   # System call code for reading an integer
        ecall
        mv      a0, a7  # Copy the input value to a0
        sw      a0, n   # Store the input value in 'n'

        # Calculate the size of the matrix (n x n elements, each 4 bytes)
        lw      a0, n
        li      a1, 4
        mul     a0, a0, a1
        sw      a0, matrix_size

        # Allocate memory for the matrix
        li      a7, 9   # System call code for sbrk (heap allocation)
        lw      a0, matrix_size
        ecall
        mv      a0, a0  # Copy the allocated pointer to a0
        sw      a0, matrix_ptr

        # Initialize the matrix with ones
        la      a1, 0(a0)  # Load the pointer to the matrix
        li      a2, 0  # Initialize row counter
init_loop:
        li      a3, 0  # Initialize column counter
col_loop:
        sw      a4, 0(a1)  # Store the value 1 in the matrix element
        addi    a1, a1, 4  # Move to the next element
        addi    a3, a3, 1  # Move to the next column
        bne     a3, n, col_loop
        addi    a2, a2, 1  # Move to the next row
        bne     a2, n, init_loop

        # Display the matrix
        li      t0, 0  # Initialize row counter
display_loop:
        # Display row label
        la      a1, 0(a0)  # Load the pointer to the matrix
        add     a1, a1, t0  # Add the row offset
        li      a2, 0  # Initialize column counter
        li      a3, 0  # Initialize column label
        li      a4, 4  # Number of bytes per element (4 for integers)
col_loop:
        lw      a5, 0(a1)  # Load the matrix element
        # Display the row and column labels and the element
        la      a6, row_label
        la      a7, col_label
        ecall  # System call to print a string
        mv      a7, a3  # Load the column label
        ecall  # System call to print a string
        mv      a7, a5  # Load the element value
        ecall  # System call to print an integer
        # Move to the next column
        addi    a1, a1, a4
        addi    a2, a2, 1
        addi    a3, a3, 1
        bne     a2, n, col_loop
        # Move to the next row
        addi    t0, t0, 1
        bne     t0, n, display_loop
        # Exit the program
        li      a7, 10
        ecall

.data
row_label:
        .asciiz "Linha "
col_label:
        .asciiz "Coluna "
