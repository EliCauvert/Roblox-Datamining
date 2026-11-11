local Parent = script.Parent.Parent
local GuiService = game:GetService("GuiService")
local SignalsModule = require(Parent.Parent.Signals)
local ResolveDisplayNameModule = require(Parent.Common.resolveDisplayName)
local GetHeadshotThumbnailModule = require(Parent.Common.getHeadshotThumbnail)
local Signal2 = nil
local Signal
Signal, Signal2 = SignalsModule.createSignal(nil)
local Signal1 = nil
local Signal2_1 = nil
Signal1, Signal2_1 = SignalsModule.createSignal(nil)
local Callback1 = nil
local Callback = nil
local SuppressNextDismissRestore = false
local Count = 0

local function fallbackMenuData(Player: Player, AnchorPosition)
	-- upvalues: GuiService (copy), Count (ref), Signal2_1 (ref), Signal2 (ref), Callback (ref), ResolveDisplayNameModule (copy), GetHeadshotThumbnailModule (copy)
	local Items = {}
	
	if GuiService:GetInspectMenuEnabled() then
		table.insert(Items, {
			key = "examine",
			label = "Examine avatar",
			onActivated = function()
				-- upvalues: GuiService (upval), Player (copy), Count (upval), Signal2_1 (upval), Signal2 (upval), Callback (upval)
				GuiService:InspectPlayerFromUserIdWithCtx(Player.UserId, "leaderBoard")
				Count += 1
				Signal2_1(nil)
				Signal2(nil)
				Signal2_1(nil)
				
				if Callback then
					Callback()
				end
			end
		})
	end
	return {
		player = Player,
		header = {
			displayName = ResolveDisplayNameModule(Player),
			username = `@{Player.Name}`,
			thumbnail = GetHeadshotThumbnailModule(Player.UserId)
		},
		items = Items,
		anchorPosition = AnchorPosition
	}
end

return {
	getMenuData = Signal,
	setMenuData = function(p1)
		-- upvalues: Signal2_1 (ref), Signal2 (ref)
		Signal2_1(nil)
		Signal2(p1)
	end,
	setMenuDataIfCurrent = function(p1, Count1): boolean
		-- upvalues: Count (ref), Signal2_1 (ref), Signal2 (ref)
		if Count1 == Count then
			Signal2_1(nil)
			Signal2(p1)
			
			return true
		else
			return false
		end
	end,
	openContextMenu = function(Player, AnchorPosition)
		-- upvalues: Count (ref), Signal2_1 (ref), Callback1 (ref), fallbackMenuData (copy), Signal2 (ref)
		Count += 1
		Signal2_1(nil)
		
		if Callback1 then
			Callback1(Player, AnchorPosition, Count)
			
			return
		else
			local FallbackMenuDataResult = fallbackMenuData(Player, AnchorPosition)
			Signal2_1(nil)
			Signal2(FallbackMenuDataResult)
		end
	end,
	closeContextMenu = function()
		-- upvalues: Count (ref), Signal2_1 (ref), Signal2 (ref), Callback (ref)
		Count += 1
		Signal2_1(nil)
		Signal2(nil)
		Signal2_1(nil)
		
		if Callback then
			Callback()
		end
	end,
	setContextMenuOpener = function(Value)
		-- upvalues: Callback1 (ref)
		Callback1 = Value
	end,
	setOnDismiss = function(Value)
		-- upvalues: Callback (ref)
		Callback = Value
	end,
	setSuppressNextDismissRestore = function(Value)
		-- upvalues: SuppressNextDismissRestore (ref)
		SuppressNextDismissRestore = Value
	end,
	takeSuppressNextDismissRestore = function(): boolean
		-- upvalues: SuppressNextDismissRestore (ref)
		local SuppressNextDismissRestore1: boolean = SuppressNextDismissRestore
		SuppressNextDismissRestore = false
		
		return SuppressNextDismissRestore1
	end,
	buildMenuHeader = function(Player)
		-- upvalues: ResolveDisplayNameModule (copy), GetHeadshotThumbnailModule (copy)
		return {
			displayName = ResolveDisplayNameModule(Player),
			username = `@{Player.Name}`,
			thumbnail = GetHeadshotThumbnailModule(Player.UserId)
		}
	end,
	reset = function()
		-- upvalues: Count (ref), Signal2_1 (ref), Signal2 (ref), Callback1 (ref), Callback (ref), SuppressNextDismissRestore (ref)
		Count += 1
		Signal2_1(nil)
		Signal2(nil)
		Signal2_1(nil)
		Callback1 = nil
		Callback = nil
		SuppressNextDismissRestore = false
	end,
	getPendingConfirmKey = Signal1,
	activateMenuItem = function(p1)
		-- upvalues: Signal1 (ref), Signal2_1 (ref)
		if not p1.requiresConfirm then
			if Signal1() ~= nil then
				Signal2_1(nil)
			end
			if p1.onActivated then
				p1.onActivated()
			end
			return
		elseif Signal1() == p1.key then
			Signal2_1(nil)
			
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
		else
			Signal2_1(p1.key)
		end
	end
}