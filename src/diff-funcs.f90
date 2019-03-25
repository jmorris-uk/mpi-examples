program example_mpi
      
    include '/usr/local/include/mpif.h'

    integer my_id, root_process, ierr, status(MPI_STATUS_SIZE)
    integer num_procs
    integer :: a, b, c, d, e

    ! Create child processes, each of which has its own variables.
    ! From this point on, every process executes a separate copy
    ! of this program.  Each process has a different process ID,
    ! ranging from 0 to num_procs minus 1, and COPIES of all
    ! variables defined in the program. No variables are shared.

    call MPI_INIT (ierr)

    ! find out MY process ID, and how many processes were started.

    call MPI_COMM_RANK (MPI_COMM_WORLD, my_id, ierr)
    call MPI_COMM_SIZE (MPI_COMM_WORLD, num_procs, ierr)

    if ( my_id .eq. 0 ) then   

    ! do some work as process 0.
    a = 10
    write(*,*) "process 0:", a

    elseif (my_id .eq. 1 ) then

    ! do some work as process 1.
    b = 20
    write(*,*) "process 1:", b

    elseif (my_id .eq. 2 ) then

    ! do some work as process 2.
    c = 30
    write(*,*) "process 2:", c

    else

    ! do this work in any remaining processes.
    d = 40
    write(*,*) "all other processes:", d

    endif

    ! Stop this process.

    call MPI_FINALIZE(ierr)
    stop
end