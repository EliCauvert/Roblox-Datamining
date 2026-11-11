local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local SetOrderModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder)
local SetOrderForTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetOrderForTryOns
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local IconsNavigationCycleUp = Images["icons/navigation/cycleUp"]
local IconsNavigationCycleDown = Images["icons/navigation/cycleDown"]
local LCSortArrowNav = RoactModule.PureComponent:extend("LCSortArrowNav")
LCSortArrowNav.validateProps = TModule.strictInterface({
	Visible = TModule.union(TModule.boolean, TModule.table),
	index = TModule.number,
	asset = TModule.table,
	currentSort = TModule.table,
	equippedAssets = TModule.table,
	tryOnItems = TModule.table,
	lookType = TModule.optional(TModule.string),
	setOrder = TModule.callback,
	setOrderForTryOns = TModule.callback,
	setCurrentSort = TModule.callback,
	sendAnalytics = TModule.callback,
	analytics = TModule.table
})

function LCSortArrowNav.moveTile(p1, p2)
	-- upvalues: LayeredClothingSortUtilsModule (copy)
	local List = {}
	
	for i, value in p1.props.currentSort do
		if i ~= p1.props.index then
			table.insert(List, value)
		end
	end
	table.insert(List, p1.props.index + p2, { id = p1.props.asset.id, typeId = p1.props.asset.typeId })
	local FormatForSetOrderWithTryOnsResult, FormatForSetOrderWithTryOnsResult2 = LayeredClothingSortUtilsModule.formatForSetOrderWithTryOns(List, p1.props.equippedAssets, p1.props.tryOnItems, p1.props.lookType)
	p1.props.setOrder(FormatForSetOrderWithTryOnsResult)
	p1.props.setOrderForTryOns(FormatForSetOrderWithTryOnsResult2)
	p1.props.setCurrentSort(List)
	p1.props.sendAnalytics(p1.props.analytics.avatarRefineAutosaved)
end

function LCSortArrowNav.init(p3)
	-- upvalues: RoactModule (copy)
	p3.animLoopConn = nil
	p3.animOutConn = nil
	p3.animInConn = nil
	p3.animating = false
	p3.upArrowPos, p3.updateUpArrowPos = RoactModule.createBinding(UDim2.fromOffset(0, 4))
	p3.downArrowPos, p3.updateDownArrowPos = RoactModule.createBinding(UDim2.fromScale(0, 0))
	
	function p3.onUpActivated()
		-- upvalues: p3 (copy)
		p3:moveTile(-1)
	end
	
	function p3.onDownActivated()
		-- upvalues: p3 (copy)
		p3:moveTile(1)
	end
end

function LCSortArrowNav.animateOut(p3)
	-- upvalues: RunService (copy)
	local Total = 4
	local Total1 = 0
	p3.animOutConn = RunService.RenderStepped:connect(function(DeltaTime: number)
		-- upvalues: Total (ref), Total1 (ref), p3 (copy)
		Total -= DeltaTime * 14
		Total1 += DeltaTime * 14
		local Largest = math.max(Total, 0)
		local Smallest = math.min(Total1, 4)
		p3.updateUpArrowPos(UDim2.new(0, 0, 0, Largest))
		p3.updateDownArrowPos(UDim2.new(0, 0, 0, Smallest))
		
		if Largest == 0 then
			p3.animOutConn:Disconnect()
			p3.animOutConn = nil
			p3:animateIn()
		end
	end)
end

function LCSortArrowNav.animateIn(p3)
	-- upvalues: RunService (copy)
	local Total = 0
	local Total1 = 4
	p3.animInConn = RunService.RenderStepped:connect(function(DeltaTime: number)
		-- upvalues: Total (ref), Total1 (ref), p3 (copy)
		Total += DeltaTime * 14
		Total1 -= DeltaTime * 14
		local Smallest = math.min(Total, 4)
		local Largest = math.max(Total1, 0)
		p3.updateUpArrowPos(UDim2.new(0, 0, 0, Smallest))
		p3.updateDownArrowPos(UDim2.new(0, 0, 0, Largest))
		
		if Smallest == 4 then
			p3.animInConn:Disconnect()
			p3.animInConn = nil
			p3.timeOfLastAnimation = tick()
			p3.animating = false
		end
	end)
end

function LCSortArrowNav.render(p3)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), ImageSetLabel (copy), IconsNavigationCycleUp (copy), IconsNavigationCycleDown (copy)
	return WithStyleFunction(function(p4)
		-- upvalues: p3 (copy), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), ConstantsModule (upval), ImageSetLabel (upval), IconsNavigationCycleUp (upval), IconsNavigationCycleDown (upval)
		local Theme = p4.Theme
		
		return RoactModule.createFragment({
			UpArrowButton = RoactModule.createElement("TextButton", {
				Text = "",
				BackgroundTransparency = 1,
				Visible = p3.props.Visible and p3.props.index ~= 1,
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil,
				Size = UDim2.fromOffset(ConstantsModule.Tile.ArrowSize.X.Offset, ConstantsModule.Tile.ArrowSize.Y.Offset + 4),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.fromScale(0.5, 0),
				[RoactModule.Event.Activated] = p3.onUpActivated
			}, {
				UpArrowIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = ConstantsModule.Tile.ArrowSize,
					Position = p3.upArrowPos,
					Image = IconsNavigationCycleUp,
					ImageColor3 = Theme.IconEmphasis.Color
				})
			}),
			DownArrowButton = RoactModule.createElement("TextButton", {
				Text = "",
				BackgroundTransparency = 1,
				Visible = p3.props.Visible and p3.props.index ~= #p3.props.currentSort,
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil,
				Size = UDim2.fromOffset(ConstantsModule.Tile.ArrowSize.X.Offset, ConstantsModule.Tile.ArrowSize.Y.Offset + 4),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, ConstantsModule.Tile.SelectedSize),
				[RoactModule.Event.Activated] = p3.onDownActivated
			}, {
				DownArrowIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = ConstantsModule.Tile.ArrowSize,
					Position = p3.downArrowPos,
					Image = IconsNavigationCycleDown,
					ImageColor3 = Theme.IconEmphasis.Color
				})
			})
		})
	end)
end

function LCSortArrowNav.didMount(p3)
	-- upvalues: RunService (copy)
	p3.timeOfLastAnimation = tick()
	p3.animLoopConn = RunService.RenderStepped:connect(function(_)
		-- upvalues: p3 (copy)
		if tick() - p3.timeOfLastAnimation >= 1 and not p3.animating then
			p3.animating = true
			p3:animateOut()
		end
	end)
end

function LCSortArrowNav.willUnmount(p3)
	if p3.animLoopConn then
		p3.animLoopConn:Disconnect()
		p3.animLoopConn = nil
	end
	if p3.animOutConn then
		p3.animOutConn:Disconnect()
		p3.animOutConn = nil
	end
	if p3.animInConn then
		p3.animInConn:Disconnect()
		p3.animInConn = nil
	end
end

return (RoactRoduxModule.connect(function(p3, _)
	local function _()
		-- upvalues: p3 (copy)
		local LookType = nil
		local Looks = p3.AvatarExperience.AvatarScene.Looks
		local LookId = p3.AvatarExperience.AvatarScene.OutfitTryOn.LookId
		
		if LookId ~= nil and Looks ~= nil then
			local Look = Looks[LookId]
			
			if Look then
				LookType = Look.lookType
			end
		end
		return LookType
	end
	
	local config = {
		currentSort = p3.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList,
		equippedAssets = p3.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		tryOnItems = p3.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	}
	local LookType = nil
	local Looks = p3.AvatarExperience.AvatarScene.Looks
	local LookId = p3.AvatarExperience.AvatarScene.OutfitTryOn.LookId
	
	if LookId ~= nil and Looks ~= nil then
		local Look = Looks[LookId]
		
		if Look then
			LookType = Look.lookType
		end
	end
	config.lookType = LookType
	
	return config
end, function(Callback)
	-- upvalues: SetOrderModule (copy), SetOrderForTryOnsFunction (copy), SetCurrentSortModule (copy), SendRefinementAnalyticsModule (copy)
	return {
		setOrder = function(p3)
			-- upvalues: Callback (copy), SetOrderModule (upval)
			Callback(SetOrderModule(p3))
		end,
		setOrderForTryOns = function(p3)
			-- upvalues: Callback (copy), SetOrderForTryOnsFunction (upval)
			Callback(SetOrderForTryOnsFunction(p3))
		end,
		setCurrentSort = function(p3)
			-- upvalues: Callback (copy), SetCurrentSortModule (upval)
			Callback(SetCurrentSortModule(p3))
		end,
		sendAnalytics = function(p3)
			-- upvalues: Callback (copy), SendRefinementAnalyticsModule (upval)
			Callback(SendRefinementAnalyticsModule(p3))
		end
	}
end)((RoactServices.connect({ analytics = AnalyticsModule })(LCSortArrowNav))))