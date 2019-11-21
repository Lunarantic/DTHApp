CREATE table PackageChannels (
	PackageID number NOT NULL,
	ChannelID number NOT NULL,
	
	constraint fk_pc_pkgid FOREIGN KEY (PackageID) REFERENCES packages (id),
	constraint fk_pc_chnid FOREIGN KEY (ChannelID) REFERENCES channels (id)
);

insert into PackageChannels values(1, 1);
insert into PackageChannels values(1, 2);
insert into PackageChannels values(1, 3);
insert into PackageChannels values(1, 4);
insert into PackageChannels values(1, 5);
insert into PackageChannels values(1, 6);
insert into PackageChannels values(1, 7);
insert into PackageChannels values(2, 8);
insert into PackageChannels values(2, 9);
insert into PackageChannels values(2, 10);
insert into PackageChannels values(2, 11);
insert into PackageChannels values(2, 12);

