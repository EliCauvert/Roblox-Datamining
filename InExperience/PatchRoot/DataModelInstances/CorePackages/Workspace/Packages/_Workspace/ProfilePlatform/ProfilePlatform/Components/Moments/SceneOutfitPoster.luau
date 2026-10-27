local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local Uri = p1.content.Uri
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local IsUseStateResultMatch: boolean = Uri ~= nil and UseStateResult == Uri
	
	return ReactModule.createElement(Image, {
		tag = "size-full",
		Image = Uri,
		ScaleType = Enum.ScaleType.Crop,
		ZIndex = p1.zIndex,
		cornerRadius = if p1.cornerRadius == nil then nil else UDim.new(0, p1.cornerRadius),
		backgroundStyle = {
			Color3 = UseTokensResult.Color.Surface.Surface_100.Color3,
			Transparency = if IsUseStateResultMatch then 0 else 1
		},
		onLoaded = ReactModule.useCallback(function(AssetFetchStatus)
			-- upvalues: UseStateResult2 (copy), Uri (copy)
			if AssetFetchStatus == Enum.AssetFetchStatus.Success then
				UseStateResult2(Uri)
			end
		end, { Uri })
	})
end