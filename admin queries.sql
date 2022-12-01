/*
  -- Dave Skura, 2022
*/


SELECT r.rolname, r.rolsuper, r.rolinherit,
  r.rolcreaterole, r.rolcreatedb, r.rolcanlogin,
  r.rolconnlimit, r.rolvaliduntil,
  ARRAY(SELECT b.rolname
        FROM pg_catalog.pg_auth_members m
        JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
        WHERE m.member = r.oid) as memberof
, r.rolreplication
, r.rolbypassrls
FROM pg_catalog.pg_roles r
WHERE r.rolname !~ '^pg_'
ORDER BY 1;

/*
rolname	rolsuper	rolinherit	rolcreaterole	rolcreatedb	rolcanlogin	rolconnlimit	rolvaliduntil	memberof	rolreplication	rolbypassrls
dad	true	true	true	true	true	-1	(null)	{}	true	false
larry	false	true	false	false	true	-1	(null)	{"users_sales"}	false	false
postgres	true	true	true	true	true	-1	(null)	{}	true	true
tomas	false	true	false	false	true	-1	(null)	{"users_accounting"}	false	false
users_accounting	false	true	false	false	false	-1	(null)	{}	false	false
users_sales	false	true	false	false	false	-1	(null)	{}	false	false

*/