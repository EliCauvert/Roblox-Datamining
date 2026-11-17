local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ChromeModule = require(Parent.Chrome)
local DisplayModule = require(Parent.Display)
local InGameMenu = require(Parent.CoreScriptsCommon).Constants.InGameMenu
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local DoesMenuPageCloseSideSheetModule = require(InExperienceSideSheet.Utils.doesMenuPageCloseSideSheet)
local GetHasRoomForPeoplePageModule = require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local GetSideSheetDrawerWidthModule = require(InExperienceSideSheet.Utils.getSideSheetDrawerWidth)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local _Vector2 = Vector2.new(InGameMenu.HubBarWidth + InGameMenu.HubPaddingX * 2, InGameMenu.PageMaxHeight + InGameMenu.HubBarHeight + InGameMenu.HubPaddingBottom)

local function centerMenuInArea(p1, Vector)
	local Smallest = math.min(p1.size.X, Vector.X)
	local Smallest1 = math.min(p1.size.Y, Vector.Y)
	
	return {
		position = Vector2.new(p1.position.X + (p1.size.X - Smallest) / 2, p1.position.Y + (p1.size.Y - Smallest1) / 2),
		size = Vector2.new(Smallest, Smallest1)
	}
end

local function getAreaBesideSideSheet(X: number, Y: number)
	-- upvalues: GetSideSheetVisibilityModule (copy), GetHasRoomForPeoplePageModule (copy), GetSideSheetDrawerWidthModule (copy), ConstantsModule (copy), DisplayModule (copy), centerMenuInArea (copy), _Vector2 (copy)
	if not GetSideSheetVisibilityModule() or not GetHasRoomForPeoplePageModule(false, X) then
		return nil
	end
	local SideSheetDrawerWidthModule = GetSideSheetDrawerWidthModule(false)
	
	if SideSheetDrawerWidthModule <= 0 then
		SideSheetDrawerWidthModule = ConstantsModule.NominalSideSheetWidth
	end
	local DeviceSafePadding = DisplayModule.GetDisplayStore(false).getDeviceSafePadding(false)
	local NewSideSheetDrawerWidthModule = SideSheetDrawerWidthModule + math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.left)
	local Largest = math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.top)
	
	return (centerMenuInArea({
		position = Vector2.new(NewSideSheetDrawerWidthModule, Largest),
		size = Vector2.new(math.max(0, X - NewSideSheetDrawerWidthModule - math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.right)), (math.max(0, Y - Largest - math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.bottom))))
	}, _Vector2))
end

return {
	doesMenuPageCloseSideSheet = DoesMenuPageCloseSideSheetModule,
	doesMenuStayOpenAloneOnSideSheetRelease = function(p1, p2, p3: number): boolean
		-- upvalues: DoesMenuPageCloseSideSheetModule (copy), GetHasRoomForPeoplePageModule (copy)
		return if p1 then if DoesMenuPageCloseSideSheetModule(p2) then true else not GetHasRoomForPeoplePageModule(false) or p3 ~= nil and (p3 > 0 and not GetHasRoomForPeoplePageModule(false, p3)) else false
	end,
	getAreaBesideSideSheet = getAreaBesideSideSheet,
	getBesideSideSheetWindowArea = function()
		-- upvalues: DisplayModule (copy), getAreaBesideSideSheet (copy)
		local ViewportSize = DisplayModule.GetDisplayStore(false).getViewportSize(false)
		
		return (getAreaBesideSideSheet(ViewportSize.X, ViewportSize.Y))
	end,
	getInGameMenuMaxSize = function()
		-- upvalues: _Vector2 (copy)
		return _Vector2
	end,
	getWindowPositionBesideSideSheet = function(WindowBesideSheet, p1, _, Vector)
		-- upvalues: SideSheetOpenBehavior (copy), getAreaBesideSideSheet (copy)
		if WindowBesideSheet == SideSheetOpenBehavior.WindowBesideSheet then
			local AreaBesideSideSheet = getAreaBesideSideSheet(Vector.X, Vector.Y)
			
			return if AreaBesideSideSheet == nil then p1 else UDim2.fromOffset(AreaBesideSideSheet.position.X, AreaBesideSideSheet.position.Y)
		else
			return p1
		end
	end,
	isWindowBesideSideSheet = function(WindowBesideSheet): boolean
		-- upvalues: SideSheetOpenBehavior (copy)
		return WindowBesideSheet == SideSheetOpenBehavior.WindowBesideSheet
	end,
	shouldCloseSideSheetOnItemActivated = function(CloseSheet): boolean
		-- upvalues: GetHasRoomForPeoplePageModule (copy), SideSheetOpenBehavior (copy)
		return not GetHasRoomForPeoplePageModule() or (CloseSheet == nil or CloseSheet == SideSheetOpenBehavior.CloseSheet)
	end
}