IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'LastTrade')
BEGIN
	CREATE TABLE [dbo].LastTrade
	(
		[Id] INT NOT NULL, 
		InstrumentID INT NOT NULL, 
		[ShortName] NVARCHAR(255) NOT NULL, 
		[DateTimeEn] DATETIME NOT NULL,
		[OpenPrice] DECIMAL NULL,
		[HighPrice] DECIMAL NULL,
		[LowPrice] DECIMAL NULL,
		[ClosePrice] DECIMAL NOT NULL,
		[RealClosePric] DECIMAL NULL
	)
END

DELETE LastTrade

SELECT 
	InstrumentID, max(DateTimeEn) as DateTimeEn
INTO #MaxDateTimeTrade
FROM 
	dbo.Trade
GROUP BY
	InstrumentID

INSERT INTO LastTrade
SELECT
	Trade.ID,
	trade.InstrumentID,
	instrument.ShortName,
	trade.DateTimeEn,
	trade.OpenPrice,
	trade.HighPrice,
	trade.LowPrice,
	trade.ClosePrice,
	trade.RealClosePrice
FROM
	#MaxDateTimeTrade maxDateTimeTrade INNER JOIN
	Trade trade ON Trade.InstrumentID = maxDateTimeTrade.InstrumentID and trade.DateTimeEn = maxDateTimeTrade.[DateTimeEn] INNER JOIN
	Instrument instrument ON instrument.ID = trade.InstrumentID
	
SELECT * FROM LastTrade

DROP TABLE #MaxDateTimeTrade