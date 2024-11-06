# NGT-Task-3.4
Tools and scripts for NGT Task 3.4 - "HLT Optimal Calibrations"

## Provisional recipe
```
cmsrel CMSSW_14_2_0_pre3
cd CMSSW_14_2_0_pre3/src
cmsenv
git cms-addpkg DQM/Integration
git cms-addpkg Configuration/StandardSequences
git cherry-pick 0068f5ffc11146c13108cd48607594eca23d4f45
scram b -j 20
git clone git@github.com:mmusich/NGT-Task-3.4.git .
cd NGT-Task-3.4
./testOfflineGT.sh
cd ..
cmsRun DQM/Integration/python/clients/hlt_dqm_sourceclient-live_cfg.py inputFiles=NGTTests/output.root
```

