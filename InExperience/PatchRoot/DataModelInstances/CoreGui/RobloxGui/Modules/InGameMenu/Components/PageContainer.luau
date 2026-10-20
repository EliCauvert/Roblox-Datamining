local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local Otter = InGameMenuDependenciesModule.Otter
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local BlurredModalPortalModule = require(script.Parent.BlurredModalPortal)
local PagesModule = require(script.Parent.Pages)
local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local ComponentModules = {}

for i, value in pairs(PagesModule.pagesByKey) do
	ComponentModules[i] = require(value.component)
end
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local PageContainer = Roact.PureComponent:extend("PageContainer")
PageContainer.validateProps = T.strictInterface({
	currentPage = T.string,
	visible = T.boolean,
	controllerBarHeight = T.number,
	controllerBarCount = T.number
})

function PageContainer.init(p1, p2)
	-- upvalues: GuiService (copy), PagesModule (copy), Roact (copy), Otter (copy)
	function p1.onContainerRendered(SelectionParent, CurrentPage)
		-- upvalues: p1 (copy), GuiService (upval)
		if SelectionParent then
			local SelectionParentNameFromKey = p1.getSelectionParentNameFromKey(CurrentPage)
			GuiService:RemoveSelectionGroup(SelectionParentNameFromKey)
			GuiService:AddSelectionParent(SelectionParentNameFromKey, SelectionParent)
		end
	end
	
	function p1.getSelectionParentNameFromKey(Text): string
		return Text .. "_IGMPageSelectionGroup"
	end
	
	local t = {}
	local t1 = {}
	local t2 = {}
	p1.pagePositions = {}
	p1.pageVisibilities = {}
	
	for i, _ in pairs(PagesModule.pagesByKey) do
		local v1: number = if p2.currentPage == i then 1 else 0
		t[i], t1[i] = Roact.createBinding(v1)
		t2[i] = v1
		p1.pagePositions[i] = t[i]:map(function(p3: number): UDim2
			return UDim2.new(p3 - 1, 0, 0, 0)
		end)
		p1.pageVisibilities[i] = t[i]:map(function(p3): boolean
			return p3 ~= 0 and p3 ~= 1.25
		end)
	end
	p1.pageMotor = Otter.createGroupMotor(t2)
	p1.pageMotor:onStep(function(List)
		-- upvalues: t1 (copy)
		for i, value in pairs(List) do
			t1[i](value)
		end
	end)
end

function PageContainer.render(p3)
	-- upvalues: PagesModule (copy), WithLocalizationModule (copy), Roact (copy), ComponentModules (copy), BlurredModalPortalModule (copy), ConstantsModule (copy)
	local t = {}
	
	for i, value in pairs(PagesModule.pagesByKey) do
		local PageVisibility = p3.pageVisibilities[i]
		t[i] = WithLocalizationModule({ title = value.title })(function(p4)
			-- upvalues: value (copy), Roact (upval), p3 (copy), i (copy), PageVisibility (copy), ComponentModules (upval), BlurredModalPortalModule (upval)
			return if value.isModal then Roact.createElement(BlurredModalPortalModule, { Enabled = p3.props.currentPage == i }, {
				ModalPageContent = Roact.createElement(ComponentModules[i], { pageTitle = p4.title })
			}) else Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = p3.pagePositions[i],
				BackgroundTransparency = 1,
				ZIndex = value.navigationDepth,
				Visible = PageVisibility,
				[Roact.Ref] = function(p5)
					-- upvalues: p3 (upval), i (upval)
					p3.onContainerRendered(p5, i)
				end
			}, {
				Page = Roact.createElement(ComponentModules[i], { pageTitle = value.title and p4.title })
			})
		end)
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(0, 400, 1, p3.props.controllerBarCount > 0 and -1 * ConstantsModule.ControllerBarHeight or nil),
		Position = UDim2.new(0, 64, 0, 0),
		Visible = p3.props.visible
	}, t)
end

function PageContainer.didUpdate(p4, p5, _)
	-- upvalues: PagesModule (copy), Otter (copy)
	local CurrentPage = p5.currentPage
	local CurrentPage1 = p4.props.currentPage
	
	if CurrentPage ~= CurrentPage1 then
		local IsModal = PagesModule.pagesByKey[CurrentPage1].isModal
		local IsModal1 = PagesModule.pagesByKey[CurrentPage].isModal
		
		if IsModal or IsModal1 then return end
		if PagesModule.pagesByKey[CurrentPage].navigationDepth < PagesModule.pagesByKey[CurrentPage1].navigationDepth then
			if not IsModal then
				p4.pageMotor:setGoal({ [CurrentPage] = Otter.spring(1.25, { frequency = 2.5 }) })
			end
		elseif PagesModule.pagesByKey[CurrentPage].navigationDepth == PagesModule.pagesByKey[CurrentPage1].navigationDepth then
			p4.pageMotor:setGoal({ [CurrentPage] = Otter.spring(0, { frequency = 2.5 }) })
		else
			local SpringResults = {}
			local ParentPage = CurrentPage
			while ParentPage ~= nil and ParentPage ~= CurrentPage1 do
				SpringResults[ParentPage] = Otter.spring(0, { frequency = 3.5 })
				ParentPage = PagesModule.pagesByKey[ParentPage].parentPage
			end
			p4.pageMotor:setGoal(SpringResults)
		end
		p4.pageMotor:setGoal({ [CurrentPage1] = Otter.spring(1, { frequency = 2.5 }) })
	end
end

function PageContainer.willUnmount(p6)
	-- upvalues: PagesModule (copy), GuiService (copy)
	for i, value in pairs(PagesModule.pagesByKey) do
		if not value.isModal then
			GuiService:RemoveSelectionGroup((p6.getSelectionParentNameFromKey(i)))
		end
	end
end

return RoactRodux.UNSTABLE_connect2(function(p7)
	return {
		currentPage = p7.menuPage,
		visible = p7.isMenuOpen,
		controllerBarHeight = p7.controllerBarHeight,
		controllerBarCount = p7.controllerBarCount
	}
end)(PageContainer)