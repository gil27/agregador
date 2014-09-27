Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "EyTQkphOoGSERoXUsA4Icdkna", "881jry8hXPCl4uyNTteQOSA9JObeGgOJPMCdCj3wVmHIf1B8rm"
  provider :facebook, "1537035633177856", "3f301031f2921a0675e88f33d20e225e"
end