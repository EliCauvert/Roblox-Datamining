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
local var10 = nil
local var11 = nil

function mount() --[[ line: 20 ]]
	-- upvalues: var10 (write), var11 (write), coreGuiService (ref), reactRobloxModule (ref), guiService (ref), constantsModule (ref), contextActionService (ref), reactModule (ref), inExpOverlayModule (ref)
	if not var10 then
		if not var11 then
			var11 = Instance.new("Folder")
			var11.Name = "Overlay"
			var11.Parent = coreGuiService
		end
		var10 = reactRobloxModule.createRoot(var11)
	end
	guiService:SetMenuIsOpen(true, constantsModule.OVERLAY_MENU_NAME)
	contextActionService:BindCoreAction(constantsModule.OVERLAY_CORE_ACTION_NAME, function() --[[ line: 33 ]] end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	var10:render(reactModule.createElement(inExpOverlayModule, { gui = var11 }))
end

function unmount() --[[ line: 43 ]]
	-- upvalues: var10 (write), contextActionService (ref), constantsModule (ref), guiService (ref)
	if var10 then
		var10:unmount()
		contextActionService:UnbindCoreAction(constantsModule.OVERLAY_CORE_ACTION_NAME)
		guiService:SetMenuIsOpen(false, constantsModule.OVERLAY_MENU_NAME)
	end
end

local var12 = nil

return function() --[[ line: 52 ]]
	-- upvalues: getOverlayStoreModule (ref), var12 (write), signalsModule (ref)
	local var13 = getOverlayStoreModule(false)
	var12 = signalsModule.createEffect(function(p0) --[[ line: 55 ]]
		-- upvalues: var13 (ref)
		if var13.getCurrentOverlayType(p0) then
			mount()
			
			return
		end
		unmount()
	end)
end