#!/bin/bash -ex

hltGetConfiguration /dev/CMSSW_14_1_0/GRun \
   --globaltag 141X_dataRun3_Prompt_v3 \
   --data \
   --unprescale \
   --output minimal \
   --max-events 100 \
   --eras Run3_2024 --l1-emulator uGT --l1 L1Menu_Collisions2024_v1_3_0_xml \
   --input /store/data/Run2024H/EphemeralHLTPhysics0/RAW/v1/000/386/071/00000/3a502248-b2ac-4e8a-b9bf-5f98d5c688dd.root \
   > hltData.py


cat <<@EOF >> hltData.py

## put here the output commands of the 
process.hltOutputMinimal.outputCommands = [
    'drop *',
    'keep *_hltDoubletRecoveryPFlowTrackSelectionHighPurity_*_*',
    'keep *_hltEcalRecHit_*_*',
    'keep *_hltEgammaCandidates_*_*',
    'keep *_hltEgammaGsfTracks_*_*',
    'keep *_hltGlbTrkMuonCandsNoVtx_*_*',
    'keep *_hltHbhereco_*_*',
    'keep *_hltHfreco_*_*',
    'keep *_hltHoreco_*_*',
    'keep *_hltIter0PFlowCtfWithMaterialTracks_*_*',
    'keep *_hltIter0PFlowTrackSelectionHighPurity_*_*',
    'keep *_hltL3NoFiltersNoVtxMuonCandidates_*_*',
    'keep *_hltMergedTracks_*_*',
    'keep *_hltPFMuonMerging_*_*',
    'keep *_hltOnlineBeamSpot_*_*',
    'keep *_hltPixelTracks_*_*',
    'keep *_hltPixelVertices_*_*',
    'keep *_hltSiPixelClusters_*_*',
    'keep *_hltSiStripRawToClustersFacility_*_*',
    'keep *_hltTrimmedPixelVertices_*_*',
    'keep *_hltVerticesPFFilter_*_*',
    'keep FEDRawDataCollection_rawDataCollector_*_*',
    'keep GlobalObjectMapRecord_hltGtStage2ObjectMap_*_*',
    'keep edmTriggerResults_*_*_*',
    'keep triggerTriggerEvent_*_*_*' 
]

del process.MessageLogger
process.load('FWCore.MessageLogger.MessageLogger_cfi')
@EOF

cmsRun hltData.py >& hltData.log
