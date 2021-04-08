create user 'testuser'@'%' identified by 'password';
create user 'testuser'@'localhost' identified by 'password';

grant all privileges on objectdb.* to 'testuser'@'%';
grant all privileges on objectdb.* to 'testuser'@'localhost';

create table if not exists objectdb.externalarticle (
    id varchar(10) not null,
    `type` varchar(10) not null default 'pubmed',
    primary key (id)
);

insert into objectdb.externalarticle (id) values ('7683628'),
    ('18456578'),
    ('20021716'),
    ('22658665'),
    ('22975760'),
    ('23891399'),
    ('23974870'),
    ('25087612'),
    ('27171515'),
    ('28546993');