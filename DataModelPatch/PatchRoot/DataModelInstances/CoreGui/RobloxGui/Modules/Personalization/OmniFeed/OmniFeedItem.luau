local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local OmniFeedService = require(CorePackages.Workspace.Packages.OmniFeedService).OmniFeedService
local OmniFeedConstants = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local OmniFeedItem = RoactModule.PureComponent:extend("OmniFeedItem")
OmniFeedItem.validateProps = TModule.strictInterface({
	omniFeedItemType = TModule.string,
	layoutOrder = TModule.optional(TModule.number),
	zIndex = TModule.optional(TModule.number),
	impressionsTag = TModule.string,
	itemIndex = TModule.number,
	feedItemNameId = TModule.string,
	itemProps = TModule.optional(TModule.table),
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	navBarPlacement = TModule.valueOf(AppNavBarModule.Placement),
	eventIngest = TModule.any
})

function OmniFeedItem.init(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppsDefaultSelection (copy), HttpService (copy), OmniFeedConstants (copy), MutedErrorFunction (copy)
	p1.feedItemRef = RoactModule.createRef()
	p1.containerRef = if FFlagLuaAppsDefaultSelection then function(Current)
		-- upvalues: p1 (copy)
		if p1.props.defaultFocusRef then
			p1.props.defaultFocusRef(Current)
		end
		p1.feedItemRef.current = Current
	end else nil
	p1.descendantGuiButtons = {}
	
	function p1.addDescendantGuiButton(Object)
		-- upvalues: HttpService (upval), p1 (copy), OmniFeedConstants (upval)
		local GUIDAttribute = Object:GetAttribute("GUID")
		
		if GUIDAttribute == nil then
			GUIDAttribute = HttpService:GenerateGUID()
			Object:SetAttribute("GUID", GUIDAttribute)
		end
		if p1.descendantGuiButtons[GUIDAttribute] then
			p1.descendantGuiButtons[GUIDAttribute].connection:Disconnect()
			p1.descendantGuiButtons[GUIDAttribute] = nil
		end
		p1.descendantGuiButtons[GUIDAttribute] = {
			name = Object.Name,
			connection = Object.Activated:Connect(function(_)
				-- upvalues: p1 (upval), OmniFeedConstants (upval), Object (copy)
				if p1.isMounted then
					p1.props.eventIngest:setRBXEventStream(OmniFeedConstants.EventContext, "feedItemClicked", {
						fullPath = Object:GetFullName(),
						treatmentType = p1.props.omniFeedItemType,
						feedItemPos = p1.props.layoutOrder,
						feedItemNameId = p1.props.feedItemNameId
					})
					
					return
				end
			end)
		}
	end
	
	function p1.removeDescendantGuiButton(GUIDAttribute)
		-- upvalues: p1 (copy), MutedErrorFunction (upval)
		if GUIDAttribute ~= nil and p1.descendantGuiButtons[GUIDAttribute] then
			p1.descendantGuiButtons[GUIDAttribute].connection:Disconnect()
			p1.descendantGuiButtons[GUIDAttribute] = nil
			
			return
		end
		if p1.isMounted and not p1.descendantGuiButtonError then
			p1.descendantGuiButtonError = true
			MutedErrorFunction(`OmniFeedItem: Expecting descendant button for guid: {GUIDAttribute}, feedItemNameId: {p1.props.feedItemNameId}`)
		end
	end
	
	function p1.descendantAdded(Button)
		-- upvalues: p1 (copy)
		if Button and Button:IsA("GuiButton") then
			p1.addDescendantGuiButton(Button)
			
			return
		end
	end
	
	function p1.descendantRemoving(Button)
		-- upvalues: p1 (copy)
		if Button and Button:IsA("GuiButton") then
			p1.removeDescendantGuiButton((Button:GetAttribute("GUID")))
			
			return
		end
	end
	
	function p1.addAllDescendantGuiButtons()
		-- upvalues: p1 (copy)
		local Current = p1.feedItemRef and p1.feedItemRef.current
		
		if Current then
			local Descendants = Current:GetDescendants()
			
			if Descendants then
				for _, descendant in pairs(Descendants) do
					p1.descendantAdded(descendant)
				end
			end
		end
	end
	
	function p1.removeAllDescendantGuiButtons()
		-- upvalues: p1 (copy)
		for i, _ in pairs(p1.descendantGuiButtons) do
			p1.removeDescendantGuiButton(i)
		end
		p1.descendantGuiButtons = {}
	end
end

function OmniFeedItem.render(p2)
	-- upvalues: OmniFeedService (copy), RoactModule (copy), AppNavBarModule (copy), FFlagLuaAppsDefaultSelection (copy), MutedErrorFunction (copy)
	local OmniFeedItemType = p2.props.omniFeedItemType
	local LayoutOrder = p2.props.layoutOrder
	local Component = OmniFeedService.get():getOmniFeedItemMap().getComponent(OmniFeedItemType)
	
	if OmniFeedItemType == nil or Component == nil then
		MutedErrorFunction("OmniFeedItem: Unknown omni feed item type: " .. tostring(OmniFeedItemType) .. ", should have already been filtered out.")
		
		return nil
	else
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			SelectionGroup = true,
			SelectionBehaviorLeft = if p2.props.navBarPlacement == AppNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			LayoutOrder = LayoutOrder,
			ZIndex = p2.props.zIndex,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[RoactModule.Ref] = if FFlagLuaAppsDefaultSelection then p2.containerRef else p2.feedItemRef,
			[RoactModule.Event.DescendantAdded] = function(_, Button)
				-- upvalues: p2 (copy)
				p2.descendantAdded(Button)
			end,
			[RoactModule.Event.DescendantRemoving] = function(_, Button)
				-- upvalues: p2 (copy)
				p2.descendantRemoving(Button)
			end,
			[RoactModule.Change.AbsoluteSize] = function(p3)
				-- upvalues: p2 (copy)
				if p3 then
					local OnAbsoluteSizeChangedFunction: (any) -> () = p2.props.onAbsoluteSizeChanged
					
					if OnAbsoluteSizeChangedFunction then
						OnAbsoluteSizeChangedFunction(p3)
					end
				end
			end
		}, {
			FeedItem = RoactModule.createElement(Component, p2.props.itemProps)
		})
	end
end

function OmniFeedItem.didMount(p2)
	-- upvalues: ImpressionsTagUtility (copy)
	p2.isMounted = true
	ImpressionsTagUtility.AddTag(p2.feedItemRef, p2.props.impressionsTag, p2.props.itemIndex)
	p2.addAllDescendantGuiButtons()
end

function OmniFeedItem.willUnmount(p2)
	-- upvalues: ImpressionsTagUtility (copy)
	p2.isMounted = false
	p2.removeAllDescendantGuiButtons()
	ImpressionsTagUtility.RemoveTag(p2.feedItemRef, p2.props.impressionsTag, p2.props.itemIndex)
end

function OmniFeedItem.didUpdate(p2, p3)
	-- upvalues: ImpressionsTagUtility (copy)
	if p3.impressionsTag ~= p2.props.impressionsTag or p3.itemIndex ~= p2.props.itemIndex then
		ImpressionsTagUtility.RemoveTag(p2.feedItemRef, p3.impressionsTag, p3.itemIndex)
		ImpressionsTagUtility.AddTag(p2.feedItemRef, p2.props.impressionsTag, p2.props.itemIndex)
	end
	if p3.feedItemNameId ~= p2.props.feedItemNameId then
		p2.removeAllDescendantGuiButtons()
		p2.addAllDescendantGuiButtons()
	end
end

return RoactServices.connect({ eventIngest = AppEventIngestService })(function(p2)
	-- upvalues: UseNavBarPlacementFunction (copy), CryoModule (copy), RoactModule (copy), OmniFeedItem (copy)
	return RoactModule.createElement(OmniFeedItem, (CryoModule.Dictionary.join(p2, { navBarPlacement = UseNavBarPlacementFunction() })))
end)