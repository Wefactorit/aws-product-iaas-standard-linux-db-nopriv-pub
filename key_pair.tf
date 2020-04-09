module "key_pair_admin" {
  source          = "terraform-aws-modules/key-pair/aws"
  create_key_pair = true
  key_name        = "${var.application}-${var.env}-acces-key"
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdjr36/O+sLpcD53mZ407fX+hRHOn9X2/RzLAgI1qVfuwyHKC6ig5uTSEu76qNE5g0A6dXZvGm13UoxfkAc2kmy83TC0s3Fs+pvsyFcVIcYiW4f8RgQUgRe1M2pkh+K361kfwtsO3nmBIEeLAGxDKhj4Ku1v7B88+HvNJvoNbxRBuUcAt11zS2PHCfE0oAlPVVNzShf2Gmuu5lxC4rrX9nVPze00LSxdd5KcFZ+8lLdc7lnuwfxDwoBeCvjZLR2MKgH82TAGJdAFmchMKu0WyElOy4oLt5uClBSqXSqKiK66E83iDKoTXmaclucYFdEyVAbO9LTP8E3P1Ka95olaEiJMA9JUk+T8Ehmjnubn5Jp91oSmdWvR+m8/32Zj9PwIAfdPO8gqhX/0RzGbMWoxeL+qDGImtBtzzA+/3UNEYfX5M4rJYgElMfTE2lBszGcgA4h8gpCYUay4+y90Fcg3dVY7ZYuxy6XfFhSctkUCu+JP1nqjXGjcFsu6+n4xTSxUfeIwsi7jsgl6kLt2apU3blhr4JRwc4TDVFSgBwadGhLHlR5s5bqRyJN0d8baK6c+H5z5Lqvjr0+db4CTZGMux3jeQcjW+XvAxgpPsg7lBe5WklpYIDNEzYfLaRVYZSvfHUG6Qo2z6Ov8psCt0z9FLWpE/l72p5mIolQOqynbHwvw== Deployer@emogb.io"

}
