

CREATE TABLE Gallery
(
	[RID] AUTOINCREMENT NOT NULL,
	[Title] TEXT(255) WITH COMPRESSION NOT NULL,
	[EventDate] DATETIME  NOT NULL,
	[Description] MEMO WITH COMPRESSION,
	[Parent] LONG  NULL,
	[Disabled] YESNO  DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY( [RID] ),
	CONSTRAINT [RID] UNIQUE ([RID])
);



CREATE TABLE GalleryPictures
(
	[RID] AUTOINCREMENT NOT NULL,
	[GalleryID] LONG  NOT NULL,
	[File]  TEXT(40)  WITH COMPRESSION  NOT NULL,
	[Caption]  TEXT(255)  WITH COMPRESSION  NULL,
	[Sequence]  LONG  DEFAULT 0,
	[Disabled] YESNO  DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY( [RID] ),
	CONSTRAINT [RID] UNIQUE ([RID])
);




CREATE TABLE GalleryShuffle
(
	[RID] AUTOINCREMENT NOT NULL,
	[PictureID] LONG  NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY( [RID] )
);

CREATE INDEX [GalleryID]
	ON [GalleryPictures] ([GalleryID]);

ALTER TABLE [GalleryPictures]
	ADD CONSTRAINT [GalleryGalleryPictures]
	FOREIGN KEY NO INDEX ([GalleryID]) REFERENCES
		[Gallery] ([RID]);


UPDATE Version
	SET Major = 4, Minor = 0, Fixes = 0;
