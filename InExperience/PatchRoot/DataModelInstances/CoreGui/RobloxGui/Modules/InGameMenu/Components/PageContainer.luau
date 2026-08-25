local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local otter = inGameMenuDependenciesModule.Otter
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local blurredModalPortalModule = require(script.Parent.BlurredModalPortal)
local pagesModule = require(script.Parent.Pages)
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local t_1 = {}

for i, v in pairs(pagesModule.pagesByKey) do
	t_1[i] = require(v.component)
end
local withLocalizationModule = require(parent.Localization.withLocalization)
local pageContainer = roact.PureComponent:extend("PageContainer")
pageContainer.validateProps = t.strictInterface({
	currentPage = t.string,
	visible = t.boolean,
	controllerBarHeight = t.number,
	controllerBarCount = t.number
})

function pageContainer.init(p0, p1)
	-- upvalues: guiService (ref), pagesModule (ref), roact (ref), otter (ref)
	function p0.onContainerRendered(p2, p3)
		-- upvalues: p0 (ref), guiService (copy)
		if p2 then
			local selectionParentNameFromKey = p0.getSelectionParentNameFromKey(p3)
			guiService:RemoveSelectionGroup(selectionParentNameFromKey)
			guiService:AddSelectionParent(selectionParentNameFromKey, p2)
		end
	end
	
	function p0.getSelectionParentNameFromKey(p4)
		return p4 .. "_IGMPageSelectionGroup"
	end
	
	local t = {}
	local t_1 = {}
	local t_2 = {}
	p0.pagePositions = {}
	p0.pageVisibilities = {}
	
	for i, v in pairs(pagesModule.pagesByKey) do
		local var11 = if p1.currentPage == i then 1 else 0
		local var12, var13 = roact.createBinding(var11)
		t[i] = var12
		t_1[i] = var13
		t_2[i] = var11
		p0.pagePositions[i] = t[i]:map(function(p5)
			return UDim2.new(p5 - 1, 0, 0, 0)
		end)
		p0.pageVisibilities[i] = t[i]:map(function(p6)
			return p6 == 0 or p6 == 1.25
		end)
	end
	p0.pageMotor = otter.createGroupMotor(t_2)
	p0.pageMotor:onStep(function(p7)
		-- upvalues: t_1 (ref)
		for i, v in pairs(p7) do
			t_1[i](v)
		end
	end)
end

function pageContainer.render(p8)
	-- upvalues: pagesModule (ref), withLocalizationModule (ref), roact (ref), t_1 (ref), blurredModalPortalModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in pairs(pagesModule.pagesByKey) do
		local var16 = p8.pageVisibilities[i]
		t[i] = withLocalizationModule({ title = v.title })(function(p9)
			-- upvalues: v (ref), roact (copy), p8 (ref), i (ref), var16 (ref), t_1 (copy), blurredModalPortalModule (copy)
			return if v.isModal then roact.createElement(blurredModalPortalModule, { Enabled = p8.props.currentPage == i }, {
				ModalPageContent = roact.createElement(t_1[i], { pageTitle = p9.title })
			}) else roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = p8.pagePositions[i],
				BackgroundTransparency = 1,
				ZIndex = v.navigationDepth,
				Visible = var16,
				[roact.Ref] = function(p10)
					-- upvalues: p8 (copy), i (copy)
					p8.onContainerRendered(p10, i)
				end
			}, {
				Page = roact.createElement(t_1[i], { pageTitle = v.title and p9.title })
			})
		end)
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(0, 400, 1, if p8.props.controllerBarCount > 0 then -1 * constantsModule.ControllerBarHeight else nil),
		Position = UDim2.new(0, 64, 0, 0),
		Visible = p8.props.visible
	}, t)
end

function pageContainer.didUpdate(p11, p12, _)
	-- upvalues: pagesModule (ref), otter (ref)
	local currentPage = p12.currentPage
	local currentPage_1 = p11.props.currentPage
	
	if currentPage ~= currentPage_1 then
		local isModal = pagesModule.pagesByKey[currentPage_1].isModal
		
		if isModal or pagesModule.pagesByKey[currentPage].isModal then return end
		if pagesModule.pagesByKey[currentPage].navigationDepth < pagesModule.pagesByKey[currentPage_1].navigationDepth then
			if not isModal then
				p11.pageMotor:setGoal({ [currentPage] = otter.spring(1.25, { frequency = 2.5 }) })
			end
		elseif pagesModule.pagesByKey[currentPage].navigationDepth == pagesModule.pagesByKey[currentPage_1].navigationDepth then
			p11.pageMotor:setGoal({ [currentPage] = otter.spring(0, { frequency = 2.5 }) })
		else
			local t = {}
			local var18 = currentPage
			while var18 ~= nil and var18 ~= currentPage_1 do
				t[var18] = otter.spring(0, { frequency = 3.5 })
				var18 = pagesModule.pagesByKey[var18].parentPage
			end
			p11.pageMotor:setGoal(t)
		end
		p11.pageMotor:setGoal({ [currentPage_1] = otter.spring(1, { frequency = 2.5 }) })
	end
end

function pageContainer.willUnmount(p13)
	-- upvalues: pagesModule (ref), guiService (ref)
	for i, v in pairs(pagesModule.pagesByKey) do
		if not v.isModal then
			guiService:RemoveSelectionGroup(p13.getSelectionParentNameFromKey(i))
		end
	end
end

return roactRodux.UNSTABLE_connect2(function(p14)
	return {
		currentPage = p14.menuPage,
		visible = p14.isMenuOpen,
		controllerBarHeight = p14.controllerBarHeight,
		controllerBarCount = p14.controllerBarCount
	}
end)(pageContainer)