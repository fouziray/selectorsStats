This is a simple system to collect information about implementors and senders in Pharo.

`SelectorsStats2` is done to keep the implementors and compute the senders. 
Recent version does only one scan of all the compiled methods to compute senders.

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
