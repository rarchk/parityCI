echo "########## Installing Rust #############"
. ./config.sh 
apt-get install file sudo curl -y
curl -s https://static.rust-lang.org/rustup.sh | sh -s -- --channel=$RUST_VERSION
sleep 1 

echo "########## Building Parity #############"         
cd parity
git checkout $PARITY_VERSION 
cargo build $PARITY_BUILD_FLAGS

echo "########## Uploading to S3 #############"
sh ../aws_upload.sh target/release/parity