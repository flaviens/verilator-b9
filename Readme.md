# Bug in Verilator that leads to a vrong runtime value.

To reproduce, please have Verilator installed and run:
```
bash run.sh
```

Expected output:
```
Output (trace): 0
Output (notrace): 1
```

Actual output:
```
Output (trace): 0
Output (notrace): 0
```

Please note that no individual `-fno-` flag fixes the bug, yet enabling tracing does.
