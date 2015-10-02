#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

# log info to console
echo "Uploading the $INSTALLER artifact. This could take some time..."
echo "--------------------------------------------------------"
echo

# source the opnfv.properties to get ARTIFACT_VERSION
source $WORKSPACE/opnfv.properties

# upload artifact and additional files to google storage
gsutil cp $BUILD_DIRECTORY/opnfv-$OPNFV_ARTIFACT_VERSION.iso gs://$GS_URL/opnfv-$OPNFV_ARTIFACT_VERSION.iso > gsutil.iso.log 2>&1
gsutil cp $WORKSPACE/opnfv.properties gs://$GS_URL/opnfv-$OPNFV_ARTIFACT_VERSION.properties > gsutil.properties.log 2>&1
gsutil cp $WORKSPACE/opnfv.properties gs://$GS_URL/latest.properties > gsutil.latest.log 2>&1

echo
echo "--------------------------------------------------------"
echo "Done!"
echo "Artifact is available as http://$GS_URL/opnfv-$OPNFV_ARTIFACT_VERSION.iso"
