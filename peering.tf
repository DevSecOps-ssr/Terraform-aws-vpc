resource "aws_vpc_peering_connection" "default" {
  count = var.is_peering_required ? 1 : 0

  #Acceptor
  peer_vpc_id   = data.aws_vpc.default_vpc.id

  #Requestor
  vpc_id        = aws_vpc.main.id
  auto_accept   = true

   tags = merge(
          local.common_tags,
          {
              Name = "${var.project}-${var.environment}-default"
          },
          var.vpc_peering_tags
      )
}
