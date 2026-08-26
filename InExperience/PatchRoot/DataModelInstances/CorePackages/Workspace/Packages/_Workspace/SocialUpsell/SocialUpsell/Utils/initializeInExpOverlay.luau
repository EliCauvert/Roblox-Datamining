local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local inExpOverlayModule = require(socialUpsell.Components.InExpOverlay)
local constantsModule = require(socialUpsell.Constants)
local getOverlayStoreModule = require(socialUpsell.Store.getOverlayStore)
local var1 = nil
local var2 = nil

function mount()
	-- upvalues: var1 (write), var2 (write), coreGuiService (ref), reactRobloxModule (ref), guiService (ref), constantsModule (ref), contextActionService (ref), reactModule (ref), inExpOverlayModule (ref)
	if not var1 then
		if not var2 then
			var2 = Instance.new("Folder")
			var2.Name = "Overlay"
			var2.Parent = coreGuiService
		end
		var1 = reactRobloxModule.createRoot(var2)
	end
	guiService:SetMenuIsOpen(true, constantsModule.OVERLAY_MENU_NAME)
	contextActionService:BindCoreAction(constantsModule.OVERLAY_CORE_ACTION_NAME, function() end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	var1:render(reactModule.createElement(inExpOverlayModule, { gui = var2 }))
end

function unmount()
	-- upvalues: var1 (write), contextActionService (ref), constantsModule (ref), guiService (ref)
	if var1 then
		var1:unmount()
		contextActionService:UnbindCoreAction(constantsModule.OVERLAY_CORE_ACTION_NAME)
		guiService:SetMenuIsOpen(false, constantsModule.OVERLAY_MENU_NAME)
	end
end

local var3 = nil

return function()
	-- upvalues: getOverlayStoreModule (ref), var3 (write), signalsModule (ref)
	local var4 = getOverlayStoreModule(false)
	var3 = signalsModule.createEffect(function(p1)
		-- upvalues: var4 (ref)
		if var4.getCurrentOverlayType(p1) then
			mount()
			
			return
		end
		unmount()
	end)
end