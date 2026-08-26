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

function pageContainer.init(p1, p2)
	-- upvalues: guiService (ref), pagesModule (ref), roact (ref), otter (ref)
	function p0.onContainerRendered(p3, p4)
		-- upvalues: p1 (ref), guiService (copy)
		if p3 then
			local selectionParentNameFromKey = p1.getSelectionParentNameFromKey(p4)
			guiService:RemoveSelectionGroup(selectionParentNameFromKey)
			guiService:AddSelectionParent(selectionParentNameFromKey, p3)
		end
	end
	
	function p0.getSelectionParentNameFromKey(p3)
		return p3 .. "_IGMPageSelectionGroup"
	end
	
	local t = {}
	local t_1 = {}
	local t_2 = {}
	p1.pagePositions = {}
	p1.pageVisibilities = {}
	
	for i, v in pairs(pagesModule.pagesByKey) do
		local var1 = if p2.currentPage == i then 1 else 0
		local var2, var3 = roact.createBinding(var1)
		t[i] = var2
		t_1[i] = var3
		t_2[i] = var1
		p1.pagePositions[i] = t[i]:map(function(p3)
			return UDim2.new(p3 - 1, 0, 0, 0)
		end)
		p1.pageVisibilities[i] = t[i]:map(function(p3)
			return p3 == 0 or p3 == 1.25
		end)
	end
	p1.pageMotor = otter.createGroupMotor(t_2)
	p1.pageMotor:onStep(function(p3)
		-- upvalues: t_1 (ref)
		for i, v in pairs(p3) do
			t_1[i](v)
		end
	end)
end

function pageContainer.render(p3)
	-- upvalues: pagesModule (ref), withLocalizationModule (ref), roact (ref), t_1 (ref), blurredModalPortalModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in pairs(pagesModule.pagesByKey) do
		local var4 = p3.pageVisibilities[i]
		t[i] = withLocalizationModule({ title = v.title })(function(p4)
			-- upvalues: v (ref), roact (copy), p3 (ref), i (ref), var4 (ref), t_1 (copy), blurredModalPortalModule (copy)
			return if v.isModal then roact.createElement(blurredModalPortalModule, { Enabled = p3.props.currentPage == i }, {
				ModalPageContent = roact.createElement(t_1[i], { pageTitle = p4.title })
			}) else roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = p3.pagePositions[i],
				BackgroundTransparency = 1,
				ZIndex = v.navigationDepth,
				Visible = var4,
				[roact.Ref] = function(p5)
					-- upvalues: p3 (copy), i (copy)
					p3.onContainerRendered(p5, i)
				end
			}, {
				Page = roact.createElement(t_1[i], { pageTitle = v.title and p4.title })
			})
		end)
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(0, 400, 1, if p3.props.controllerBarCount > 0 then -1 * constantsModule.ControllerBarHeight else nil),
		Position = UDim2.new(0, 64, 0, 0),
		Visible = p3.props.visible
	}, t)
end

function pageContainer.didUpdate(p4, p5, _)
	-- upvalues: pagesModule (ref), otter (ref)
	local currentPage = p5.currentPage
	local currentPage_1 = p4.props.currentPage
	
	if currentPage ~= currentPage_1 then
		local isModal = pagesModule.pagesByKey[currentPage_1].isModal
		
		if isModal or pagesModule.pagesByKey[currentPage].isModal then return end
		if pagesModule.pagesByKey[currentPage].navigationDepth < pagesModule.pagesByKey[currentPage_1].navigationDepth then
			if not isModal then
				p4.pageMotor:setGoal({ [currentPage] = otter.spring(1.25, { frequency = 2.5 }) })
			end
		elseif pagesModule.pagesByKey[currentPage].navigationDepth == pagesModule.pagesByKey[currentPage_1].navigationDepth then
			p4.pageMotor:setGoal({ [currentPage] = otter.spring(0, { frequency = 2.5 }) })
		else
			local t = {}
			local var5 = currentPage
			while var5 ~= nil and var5 ~= currentPage_1 do
				t[var5] = otter.spring(0, { frequency = 3.5 })
				var5 = pagesModule.pagesByKey[var5].parentPage
			end
			p4.pageMotor:setGoal(t)
		end
		p4.pageMotor:setGoal({ [currentPage_1] = otter.spring(1, { frequency = 2.5 }) })
	end
end

function pageContainer.willUnmount(p6)
	-- upvalues: pagesModule (ref), guiService (ref)
	for i, v in pairs(pagesModule.pagesByKey) do
		if not v.isModal then
			guiService:RemoveSelectionGroup(p6.getSelectionParentNameFromKey(i))
		end
	end
end

return roactRodux.UNSTABLE_connect2(function(p7)
	return {
		currentPage = p7.menuPage,
		visible = p7.isMenuOpen,
		controllerBarHeight = p7.controllerBarHeight,
		controllerBarCount = p7.controllerBarCount
	}
end)(pageContainer)