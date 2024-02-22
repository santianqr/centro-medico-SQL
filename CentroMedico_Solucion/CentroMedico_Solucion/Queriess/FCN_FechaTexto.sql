

--print dbo.FCN_FechaTexto ('20190505')

ALTER FUNCTION FCN_FechaTexto (@fecha datetime)

RETURNS VARCHAR(60)

AS
BEGIN

DECLARE @dia varchar(20)
declare @mes varchar(20)
declare @fechatexto varchar(50)

SET @dia = (CASE WHEN datepart(DW, @fecha) = 1 THEN 'Domingo' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 2 THEN 'Lunes' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 3 THEN 'Martes' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 4 THEN 'Miercoles' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 5 THEN 'Jueves' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 6 THEN 'Viernes' + convert(char(2), datepart(dd, @fecha))
				WHEN datepart(DW, @fecha) = 7 THEN 'Sabado' + convert(char(2), datepart(dd, @fecha))
				END)

SET @mes = datepart(mm,@fecha)

set @mes = (CASE WHEN datepart(mm,@fecha) = 1 THEN 'Enero'
				WHEN datepart(mm,@fecha) = 2 THEN 'Febrero'
				WHEN datepart(mm,@fecha) = 3 THEN 'Marzo'
				WHEN datepart(mm,@fecha) = 4 THEN 'Abril'
				WHEN datepart(mm,@fecha) = 5 THEN 'Mayo'
				WHEN datepart(mm,@fecha) = 6 THEN 'Junio'
				WHEN datepart(mm,@fecha) = 7 THEN 'Julio'
				WHEN datepart(mm,@fecha) = 8 THEN 'Agosto'
				WHEN datepart(mm,@fecha) = 9 THEN 'Septiembre'
				WHEN datepart(mm,@fecha) = 10 THEN 'Octubre'
				WHEN datepart(mm,@fecha) = 11 THEN 'Noviembre'
				WHEN datepart(mm,@fecha) = 12 THEN 'Diciembre'
				END)

set @fechatexto = @dia + ' de ' + @mes
return @fechatexto
END