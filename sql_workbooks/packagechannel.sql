CREATE table PackageChannels (
	PackageID number NOT NULL,
	ChannelID number NOT NULL,
	
	constraint fk_pc_pkgid FOREIGN KEY (PackageID) REFERENCES packages (id),
	constraint fk_pc_chnid FOREIGN KEY (ChannelID) REFERENCES channels (id)
);

insert into PackageChannels values(1, 2);
insert into PackageChannels values(1, 8);
insert into PackageChannels values(1, 16);
insert into PackageChannels values(2, 6);
insert into PackageChannels values(2, 7);
insert into PackageChannels values(3, 1);
insert into PackageChannels values(3, 3);
insert into PackageChannels values(4, 12);
insert into PackageChannels values(4, 20);
insert into PackageChannels values(5, 14);
insert into PackageChannels values(6, 11);
insert into PackageChannels values(6, 19);
