import * as alog from 'alchemy-logging';

const cfg: alog.AlogConfig = {
  defaultLevel: alog.DEBUG,
  formatter: alog.JsonFormatter,
};
alog.configure(cfg);
alog.info('TEST', 'This is a test');
