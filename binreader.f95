program binreader

implicit none

integer, parameter :: ny = 360, nx = 720
integer(kind = 4) :: nextx(nx, ny), nexty(nx, ny)
integer :: i, j 


open(1, file = 'nextxy.bin', form = 'unformatted', access='direct', &
& status = 'old', recl = 4)

do j = 1, ny
    do i = 1, nx
        read(1, rec= j * i) nextx(i, j)
    enddo
enddo

do j = 1, ny
    do i = 1, nx
        read(1, rec= j * i + nx*ny) nexty(i, j)
    enddo
enddo

close(1)

open(2, file = 'nextx.txt', status = 'unknown')
do j = 1, ny
    do i = 1, nx
        write(2, *) nextx(i, j) 
    enddo
enddo
close(2)

open(3, file = 'nexty.txt', status = 'unknown')
do j = 1, ny
    do i = 1, nx
        write(3, *) nexty(i, j)
    enddo
enddo
close(3)

end program binreader
