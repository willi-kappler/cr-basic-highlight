;;; cr-basic-mode.el

;; Copyright © 2016, Willi Kappler

;; Author: Willi Kappler ( grandorgmx.de )
;; Version: 0.1.0
;; Created: 26 Sep 2016
;; Keywords: CR Basic
;; Homepage: https://www.github.com/
;; Based on the nice tutorial of Xah Lee: http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; Simple syntax highlighting mode for CR basic


;;; Code:

;; define several category of keywords
;; TODO: This is not a complete list...
(setq cr-basic-keywords '("NULL" "true" "false" "TRUE" "FALSE" "True" "False" "StationName" "Status" "Alias" "Units" "As" "And" "BeginProg" "EndProg" "Call" "CallTable" "Case" "Case Is" "Case Else" "Is" "Const" "ConstTable" "EndConstTable" "Debug" "DebugBreak" "Dim" "DataTable" "EndTable" "Exit" "DisplayMenu" "EndMenu" "Do" "ExitDo" "Loop" "Else" "ElseIf" "For" "To" "Next" "ExitFor" "Step" "Function" "EndFunction" "Return" "ExitFunction" "If" "Then" "EndIf" "End" "#If" "#ElseIf" "#Else" "#EndIf" "#IfDef" "Include" "Or" "Scan" "NextScan" "ExitScan" "ContinueScan" "Select" "Case" "EndSelect" "SequentialMode" "SlowSequence" "EndSequence" "Sub" "EndSub" "ExitSub" "SubScan" "NextSubScan" "SubMenu" "EndSubMenu" "While" "Wend" "Xor"))
(setq cr-basic-types '("String" "Boolean" "Long" "Float" "FP2" "IEEE4" "UINT2" "UINT4"))
(setq cr-basic-functions '("ACPower" "AddPrecise" "AM25T" "Average" "AvgRun" "AvgSpa" "ABS" "AcceptDataRecords" "ACos" "ASCII" "ASin" "Atn" "Atn2" "AngleDegrees" "ApplyandRestartSequence" "EndApplyandRestartSequence" "ArgosData" "ArgosDataRepeat" "ArgosError" "ArgosSetup" "ArgosTransmit" "ArrayLength" "AVW200" "ArrayIndex" "Battery" "BeginBurstTrigger" "BrFull" "BrFull6W" "BrHalf" "BrHalf3W" "BrHalf4W" "Broadcast" "CalFile" "Calibrate" "CHR" "CPIAddModule" "CPIFileSend" "CDM_ACPower" "CDM_Battery" "CDM_BrFull" "CDM_BrFull6W" "CDM_BrHalf" "CDM_BrHalf3W" "CDM_BrHalf4W" "CDM_Delay" "CDM_ExciteI" "CDM_ExciteV" "CDM_MuxSelect" "CDM_PanelTemp" "CDM_PeriodAvg" "CDM_PulsePort" "CDM_Resistance" "CDM_Resistance3W" "CDM_SW12" "CDM_SW5" "CDM_SWPower" "CDM_TCDiff" "CDM_TCSe" "CDM_Therm107" "CDM_Therm108" "CDM_Therm109" "CDM_VoltSE" "CDM_VoltDiff" "CDM_CurrentDiff" "CDM_VW300Config" "CDM_VW300Dynamic" "CDM_VW300Static" "CDM_VW300Rainflow" "CDM_TCComp" "CheckSum" "ClockChange" "ClockReport" "ComPortIsActive" "Cos" "CPISpeed" "Csgn" "Cosh" "CSAT3" "CSAT3B" "CSAT3BMonitor" "CS616" "CS7500" "CheckPort" "ClockSet" "Covariance" "CovSpa" "CardFlush" "CardOut" "CTYPE" "CWB100" "CWB100Diagnostics" "CWB100RSSI" "CWB100Routes" "Data" "DataLong" "DataGram" "DaylightSavingUS" "DaylightSaving" "DataTime" "DialVoice" "DataEvent" "DataInterval" "Delay" "DewPoint" "DHCPRenew" "DialModem" "DialSequence" "DNP" "DNPUpdate" "DNPVariable" "EC100" "EC100Configure" "Eqv" "EncryptExempt" "EmailSend" "EmailRelay" "EMailRecv" "Encryption" "Erase" "ESSInitialize" "ESSVariables" "EndDialSequence" "DisplayValue" "DisplayLine" "ExciteV" "EndBurstTrigger" "ExciteI" "ExciteCAO" "Exp" "EthernetPower" "I2COpen" "I2CRead" "I2CWrite" "SPIOpen" "SPIRead" "SPIWrite" "IPNetPower" "ETsz" "FFT" "FFTSpa" "FileManage" "FileMark" "FillStop" "FindSpa" "Fix" "FieldNames" "LoadFieldCal" "LoggerType" "IIF" "SampleFieldCal" "NewFieldCal" "NewFieldNames" "FieldCal" "FieldCalStrain" "FileOpen" "FileClose" "FileCopy" "FileEncrypt" "FileWrite" "FileRead" "FileReadLine" "FileRename" "FileTime" "FileSize" "FileList" "Frac" "FormatFloat" "FormatLong" "FormatLongLong" "FTPClient" "GetRecord" "GetDataRecord" "GetFile" "GetVariables" "GOESData" "GOESStatus" "GOESSetup" "GOESGPS" "GOESTable" "GOESField" "GPS" "Hex" "HexToDec" "Histogram" "Histogram4D" "HydraProbe" "HTTPGet" "HTTPPost" "HTTPPut" "HTTPOut" "TimeIntoInterval" "IfTime" "INSATSetup" "INSATStatus" "INSATData" "Int" "INTDV" "InStr" "InstructionTimes" "IPInfo" "IPRoute" "IPTrace" "IMP" "Len" "LevelCrossing" "LI7200" "LI7700" "LineNum" "Log" "LN" "Log10" "LowerCase" "Maximum" "MaxSpa" "Median" "MemoryTest" "MenuItem" "MenuPick" "MenuRecompile" "Mid" "Minimum" "MinSpa" "ModemCallback" "ModemHangup" "EndModemHangup" "Moment" "MonitorComms" "Move" "MoveBytes" "MovePrecise" "Mod" "ModbusMaster" "ModbusSlave" "MuxSelect" "NewFile" "Not" "OmniSatData" "OmniSatSTSetup" "OmniSatRandomSetup" "OmniSatStatus" "OpenInterval" "Optional" "PanelTemp" "PeakValley" "PeriodAvg" "PingIP" "PipeLineMode" "PreserveVariables" "PPPOpen" "PPPClose" "PortBridge" "PortGet" "PortSet" "PortsConfig" "PortPairConfig" "PRT" "PRTCalc" "PulseCount" "PulseCountReset" "PulsePort" "Public" "PWM" "PWR" "RainFlow" "RainFlowSample" "Randomize" "Resistance" "Resistance3W" "Read" "ReadIO" "ReadOnly" "RealTime" "RectPolar" "ResetTable" "Restore" "Replace" "Right" "Left" "RMSSpa" "RND" "Route" "Routes" "RoutersNeighbors" "Round" "Floor" "Ceiling" "RunProgram" "Sample" "SampleMaxMin" "SatVP" "SDI12Recorder" "SDI12SensorSetup" "SDI12SensorResponse" "SDMAO4" "SDMAO4A" "SDMBeginPort" "SDMCAN" "SDMCD16AC" "SDMCD16Mask" "SDMCVO4" "SDMGeneric" "SDMINT8" "SDMSpeed" "SDMSW8A" "SDMTrigger" "SDMX50" "SecsSince1990" "SemaphoreGet" "SemaphoreRelease" "SendData" "SendFile" "SendTableDef" "SendGetVariables" "SendVariables" "SerialOpen" "SerialClose" "SerialFlush" "SerialIn" "SerialInBlock" "SerialInChk" "SerialInRecord" "SerialOut" "SerialOutBlock" "SerialBrk" "SetSettings" "SetSecurity" "SetStatus" "SetSetting" "ShutDownBegin" "ShutDownEnd" "Signature" "SNMPVariable" "StaticRoute" "StdDev" "StdDevSpa" "Sgn" "Sin" "Sinh" "SDMSIO4" "SDMIO16" "SplitStr" "Sprintf" "SolarPosition" "SortSpa" "Sqr" "StrainCalc" "StrComp" "SW12" "TCSe" "TCDiff" "TCPClose" "TCPOpen" "TCPsyc" "TGA" "Therm109" "Therm108" "Therm107" "Thermistor" "TimedControl" "TimeIsBetween" "Timer" "Totalize" "TableFile" "TableHide" "Tan" "Tanh" "TDR100" "TDR200" "TimerInput" "TimeUntilTransmit" "TotalRun" "MinRun" "MaxRun" "Trim" "LTrim" "RTrim" "UDPDataGram" "UDPOpen" "Until" "UpperCase" "PakBusClock" "VaporPressure" "VibratingWire" "VoiceSetup" "VoiceSpeak" "VoiceBeg" "EndVoice" "VoiceKey" "VoiceNumber" "VoicePhrases" "VoiceHangup" "VoltSE" "VoltDiff" "WaitDigTrig" "WaitTriggerSequence" "TriggerSequence" "WebPageBegin" "WebPageEnd" "WetDryBulb" "WorstCase" "WriteIO" "WindVector" "Network" "NetworkTimeProtocol" "XMLParse" "TypeOf" "CurrentSE" "Matrix" "Gzip" "GOESCommand" "GOESCommand" "StructureType" "Quadrature" "SMSRecv" "SMSSend" "TCPActiveConnections" "WatchdogTimer" "MQTTConnect" "MQTTPublishTable" "MQTTPublishConstTable"))
(setq cr-basic-operators '("AND" "OR" "NOT" "=" "<>" ">" "<" ">=" "<=" "&" ">>" "<<" "&=" "@" "!"))

;; generate regex string for each category of keywords
(setq cr-basic-keywords-regexp (regexp-opt cr-basic-keywords 'words))
(setq cr-basic-type-regexp (regexp-opt cr-basic-types 'words))
(setq cr-basic-functions-regexp (regexp-opt cr-basic-functions 'words))
(setq cr-basic-operators-regexp (regexp-opt cr-basic-operators))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq cr-basic-font-lock-keywords
      `(
	("'.*" . font-lock-comment-face)
	("\".*?\"" . font-lock-string-face)
        (,cr-basic-type-regexp . font-lock-type-face)
        (,cr-basic-functions-regexp . font-lock-function-name-face)
        (,cr-basic-keywords-regexp . font-lock-keyword-face)
        (,cr-basic-operators-regexp . font-lock-constant-face)
        ))

;;;###autoload
(define-derived-mode cr-basic-mode prog-mode "cr-basic mode"
  "Major mode for editing CR-Basic files"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((cr-basic-font-lock-keywords) t))
  )

;; clear memory. no longer needed
(setq cr-basic-keywords nil)
(setq cr-basic-types nil)
(setq cr-basic-functions nil)
(setq cr-basic-operators nil)

;; clear memory. no longer needed
(setq cr-basic-keywords-regexp nil)
(setq cr-basic-types-regexp nil)
(setq cr-basic-functions-regexp nil)
(setq cr-basic-operators-regexp nil)

;; add the mode to the `features' list
(provide 'cr-basic-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; cr-basic-mode.el ends here
