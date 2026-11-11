local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), ReactModule (copy), View (copy), Image (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.Users[p1.LocalUserId]
	end)
	
	if UseSelectorResult then
		local DisplayName = UseSelectorResult.displayName or ""
		local Name = UseSelectorResult.name or ""
		
		return ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center gap-large size-full-0 auto-y padding-large",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Avatar = ReactModule.createElement(Image, {
				tag = "radius-circle bg-shift-300",
				LayoutOrder = 1,
				Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(UseSelectorResult.id),
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1600, UseTokensResult.Size.Size_1600)
			}),
			UsernameContainer = (DisplayName ~= "" or Name ~= "") and ReactModule.createElement(View, {
				tag = "col align-x-center gap-xxsmall size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				DisplayName = DisplayName ~= "" and ReactModule.createElement(Text, {
					tag = "auto-xy text-title-large content-emphasis",
					LayoutOrder = 1,
					Text = DisplayName
				}),
				UserName = Name ~= "" and ReactModule.createElement(Text, {
					tag = "auto-xy text-label-medium",
					LayoutOrder = 2,
					Text = "@" .. Name
				})
			})
		})
	else
		return nil
	end
end