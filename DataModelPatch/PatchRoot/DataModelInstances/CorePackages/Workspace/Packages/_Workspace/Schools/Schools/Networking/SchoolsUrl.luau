local VerificationName: string = `{require(script:FindFirstAncestor("Schools").Parent.UrlBuilder).UrlBase.APIS}/school-verification/v1`

return {
	email = `{VerificationName}/email`,
	request = `{VerificationName}/request`,
	emailOtp = `{VerificationName}/email/otp`,
	emailResend = `{VerificationName}/email/resend`,
	school = `{VerificationName}/school`
}