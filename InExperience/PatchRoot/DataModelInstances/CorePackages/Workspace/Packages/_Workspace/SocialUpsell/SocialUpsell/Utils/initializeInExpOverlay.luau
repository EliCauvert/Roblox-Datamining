local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local InExpOverlayModule = require(SocialUpsell.Components.InExpOverlay)
local ConstantsModule = require(SocialUpsell.Constants)
local GetOverlayStoreModule = require(SocialUpsell.Store.getOverlayStore)
local Root = nil
local Folder = nil

function mount() --[[ Line: 20 ]]
	-- upvalues: Root (ref), Folder (ref), CoreGui (copy), ReactRobloxModule (copy), GuiService (copy), ConstantsModule (copy), ContextActionService (copy), ReactModule (copy), InExpOverlayModule (copy)
	if not Root then
		if not Folder then
			Folder = Instance.new("Folder")
			Folder.Name = "Overlay"
			Folder.Parent = CoreGui
		end
		Root = ReactRobloxModule.createRoot(Folder)
	end
	GuiService:SetMenuIsOpen(true, ConstantsModule.OVERLAY_MENU_NAME)
	ContextActionService:BindCoreAction(ConstantsModule.OVERLAY_CORE_ACTION_NAME, function() --[[ Line: 33 ]] end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	Root:render(ReactModule.createElement(InExpOverlayModule, { gui = Folder }))
end

function unmount() --[[ Line: 43 ]]
	-- upvalues: Root (ref), ContextActionService (copy), ConstantsModule (copy), GuiService (copy)
	if Root then
		Root:unmount()
		ContextActionService:UnbindCoreAction(ConstantsModule.OVERLAY_CORE_ACTION_NAME)
		GuiService:SetMenuIsOpen(false, ConstantsModule.OVERLAY_MENU_NAME)
	end
end

local Effect = nil

return function() --[[ Line: 52 ]]
	-- upvalues: GetOverlayStoreModule (copy), Effect (ref), SignalsModule (copy)
	local OverlayStoreModule = GetOverlayStoreModule(false)
	Effect = SignalsModule.createEffect(function(p1) --[[ Line: 55 ]]
		-- upvalues: OverlayStoreModule (copy)
		if OverlayStoreModule.getCurrentOverlayType(p1) then
			mount()
			
			return
		else
			unmount()
		end
	end)
end