This is a simple system to collect information about implementors and senders in Pharo.

`SelectorsStats2` is done to keep the implementors and compute the senders. 
So far the implementation is slow because it scans the complete memory for each method. 
We should do a better version that is scanning once the full memory

```
SelectorsStats2 new
	analyze;
	computeUniquelyImplementedSelectors;
	computeUniquelyImplementedSenders;
	inspect
```

Here is how to generate a ston file with the results. 

```
	STON put: self onStreamPretty: (FileSystem workingDirectory / 'uniq.ston') asFileReference writeStream
```
