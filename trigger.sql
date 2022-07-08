create or replace function update_update_schedule() returns trigger 
as 
$$
declare newcode int;
declare oldcode int;
begin
	newcode = new.film_code;
	oldcode = old.film_code;
	update public.schedule set film_code = newcode where film_code = oldcode;
	return new;
end;
$$
language plpgsql;

create or replace trigger before_film_update before update on public.films
for each row execute procedure update_update_schedule();

create or replace function update_delete_schedule() returns trigger
as
$$
declare fcode int;
begin
	fcode = old.film_code
	delete from public.schedule where film_code = fcode;
	return null;
end;
$$
language plpgsql;

create or replace trigger before_film_delete before update on public.films
for each row execute procedure update_delete_schedule();
