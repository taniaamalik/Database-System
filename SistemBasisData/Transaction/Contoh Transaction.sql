Create database ContohTransaksi3
use ContohTransaksi3

Create table accounts3 (
Id int NOT NULL PRIMARY KEY,
Balance decimal NOT NULL
)


insert into accounts3 values (1111, 2000)
insert into accounts3 values (2222, 4000)
insert into accounts3 values (3333, 500)
insert into accounts3 values (4444, 6000)
insert into accounts3 values (5555, 300)

rollback transaction

select * from accounts3

SET IMPLICIT_TRANSACTIONS ON
insert into accounts3 values (6666, 2000)
rollback transaction
insert into accounts3 values (7777, 8000)
commit transaction
rollback transaction

SET IMPLICIT_TRANSACTIONS OFF
insert into accounts3 values (9999, 900)
insert into accounts3 values (1212, 1100)

select * from accounts3

BEGIN TRAN t1
	insert into accounts3 values (3131, 2300)
	commit transaction t1
	insert into accounts3 values (4141, 5400)

BEGIN TRAN transfer1
	declare @AkunPengirim int, @CheckBalancePengirim decimal, @amount int
	SET @amount = 100;
	SET @AkunPengirim = (Select id from accounts3 where id = 5555);
	SET @CheckBalancePengirim = (SELECT Balance from accounts3 where id = 5555) - @amount
	Update accounts3 set Balance = Balance - @amount
	where id = @AkunPengirim;
	if @@ROWCOUNT <> 1
	BEGIN;
	ROLLBACK;
	print ('Invalid Account Pengirim');
	END;
	if @CheckBalancePengirim < 0
	BEGIN;
	ROLLBACK;
	print ('Saldo tidak mencukupi');
	END;

	declare @AkunPenerima int;
	SET @AkunPenerima = (Select id from accounts3 where id = 6666);
	Update accounts3 set Balance = Balance + @amount
	where id = @AkunPenerima;
	if @@ROWCOUNT <> 1
	BEGIN;
	ROLLBACK;
	print ('Invalid Account Penerima');
	END;
COMMIT TRANSACTION transfer1;

Select * from accounts3


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

BEGIN TRANSACTION
update accounts3 
set Balance = 0
where id = 1111

Select * from accounts3
where id = 1111

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

ROLLBACK TRANSACTION


SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

BEGIN TRANSACTION
update accounts3 
set Balance = 0
where id = 1111
commit transaction

Select * from accounts3
where id = 1111

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

ROLLBACK TRANSACTION


SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

BEGIN TRANSACTION
update accounts3 
set Balance = 0
where id = 1111

Select * from accounts3
where id = 1111

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

ROLLBACK TRANSACTION


SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

Begin transaction
select * from accounts3
where id between 1111 and 2222
commit transaction

Begin transaction
insert into accounts3 values (1313,100)
commit transaction

select * from accounts3
where id between 1111 and 2222
commit tran

ROLLBACK TRANSACTION


ALTER DATABASE ContohTransaksi3
SET ALLOW_SNAPSHOT_ISOLATION ON
GO

SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRANSACTION
Select * from accounts3
where id = 1111

BEGIN TRANSACTION
update accounts3
set Balance = 0
where id = 1111
commit transaction
Select * from accounts3
where id = 1111

BEGIN TRANSACTION
Select * from accounts3
where id = 1111

ROLLBACK TRANSACTION
