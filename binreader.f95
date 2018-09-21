program binreader

implicit none

integer, parameter :: ny = 360, nx = 720
integer(kind = 4) :: nextx(nx, ny), nexty(nx, ny)
integer :: i, j, k 
integer :: i_0, last, new_rec


open(1, file = 'nextxy.bin', form = 'unformatted', access='direct', &
& status = 'old', recl = 4)

i_0 = 0
do j = 1, ny
    do i = 1, nx
	if (mod(i, 720).eq.0) then
	    i_0 = i_0 + 720
        endif
	read(1, rec=i + i_0) nextx(i, j)
    enddo
enddo
close(1)

open(2, file = 'nextxy.bin', form = 'unformatted', access='direct', &
& status = 'old', recl = 4)

i_0 = 0
!new_rec = nx*ny 
read(2, rec=nx*ny)
inquire(2, nextrec=new_rec) 
do j = 1, ny
    do i = 1, nx
!	if (mod(i, 720).eq.0) then
!	    i_0 = i_0 + 720
!	    new_rec = new_rec + i_0
!        endif
!	read(2, rec=new_rec + i) nexty(i, j)
	read(2, rec=new_rec) nexty(i, j)
	inquire(2, nextrec=new_rec)
    enddo
enddo

close(2)

open(3, file = 'nextx.txt', status = 'unknown')

do j = 1, ny
    do i = 1, nx
        write(3, *) nextx(i, j)
    enddo
enddo

close(3)

open(4, file = 'nexty.txt', status = 'unknown')

do j = 1, ny
    do i = 1, nx
        write(4, *) nexty(i, j)
    enddo
enddo

close(4)

open(5, file = 'lon.txt', status = 'unknown')

do j = 1, ny
    do i = 1, nx
        write(5, *) i
    enddo
enddo

close(5)

open(6, file = 'lat.txt', status = 'unknown')

do j = 1, ny
    do i = 1, nx
        write(6, *) j
    enddo
enddo

close(6)





end program binreader
