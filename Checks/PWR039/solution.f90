! PWR039: Consider loop interchange to improve the locality of reference and
! enable vectorization

subroutine matmul_improved_f(n, A, B, C) bind(c)
  use iso_c_binding, only : c_int, c_double

  implicit none
  integer(kind=c_int), intent(in), value :: n
  real(kind=c_double), dimension(1:n, 1:n), intent(in) :: A, B
  real(kind=c_double), dimension(1:n, 1:n), intent(inout) :: C
  integer(kind=c_int) :: i, j, k

  do i = 1, n
    do k = 1, n
      do j = 1, n
        C(j, i) = C(j, i) + A(j, k) * B(k, i)
      end do
    end do
  end do
end subroutine matmul_improved_f
