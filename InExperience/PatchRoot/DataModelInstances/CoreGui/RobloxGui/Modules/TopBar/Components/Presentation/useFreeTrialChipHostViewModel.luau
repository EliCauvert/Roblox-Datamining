local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FreeTrialTopBarSlot = if InExperienceShopModule.FFlagEnableFreeTrialTopBarChip then InExperienceShopModule.FreeTrialTopBarSlot else nil
local Chrome = script.Parent.Parent.Parent.Parent.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local _ = require(script.Parent.FreeTrialChipHostView)

local function openInExperienceShop()
	-- upvalues: EnabledFunction (copy), InExperienceShopModule (copy), Chrome (copy)
	if not EnabledFunction() then return end
	if InExperienceShopModule.FFlagCenterInExperienceShopWindow then
		require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
		
		return
	else
		require(Chrome.Service):toggleWindow(require(Chrome.ChromeShared.Unibar.Constants).IN_EXPERIENCE_SHOP_ID)
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), FreeTrialTopBarSlot (copy), openInExperienceShop (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return if FreeTrialTopBarSlot == nil then nil else {
		position = p1.position,
		size = p1.size,
		zIndex = if p1.zIndex == nil then 100 else p1.zIndex,
		visible = p1.visible,
		maxWidth = UseStateResult,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
			local X: number = Frame.AbsoluteSize.X
			
			if X > 0 and X ~= UseStateResult then
				UseStateResult2(X)
			end
		end,
		onActivated = openInExperienceShop,
		slot = FreeTrialTopBarSlot
	}
end