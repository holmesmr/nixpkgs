{ buildGoModule, lib, fetchFromGitHub }:

buildGoModule rec {
  pname = "chamber";
  version = "2.13.5";

  src = fetchFromGitHub {
    owner = "segmentio";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-uwTEHxaPG1jDeR+84ZrsP6bg5DBsKIeuHeZAtgrsy/s=";
  };

  CGO_ENABLED = 0;

  vendorHash = "sha256-BkTC6sqitc1OHdQFlA2BtqxHI31ubBj2GRszs3YlWsA=";

  ldflags = [ "-s" "-w" "-X main.Version=v${version}" ];

  meta = with lib; {
    description =
      "A tool for managing secrets by storing them in AWS SSM Parameter Store";
    homepage = "https://github.com/segmentio/chamber";
    license = licenses.mit;
    maintainers = with maintainers; [ kalekseev ];
  };
}
