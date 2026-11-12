return function(RaycastResult): boolean
	local CapturesPage = RaycastResult.Instance.CapturesPage
	
	if not CapturesPage then
		return false
	end
	if RaycastResult:GetVisibility() then
		RaycastResult:SwitchToPage(CapturesPage, true)
	else
		RaycastResult:SetVisibility(true, false, CapturesPage)
	end
	return true
end