local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Parent = SocialTab.Parent
local UiModeStyleProvider = DependenciesModule.UiModeStyleProvider
local MockLocaleModule = require(script.Parent.mockLocale)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local RadioButtonList = UIBlox.App.InputButton.RadioButtonList
local RoactRodux = DependenciesModule.RoactRodux
local Rodux = DependenciesModule.Rodux
local ApolloClientModule = require(Parent.ApolloClient)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient

local function v11(p1)
	-- upvalues: Roact (copy), RadioButtonList (copy), UIBlox (copy)
	local RadioButtons = { "Dark", "Light" }
	local config = {
		radioButtonList = Roact.createElement(RadioButtonList, {
			radioButtons = RadioButtons,
			onActivated = function(p2)
				-- upvalues: p1 (copy), RadioButtons (copy)
				p1.updateStyle(RadioButtons[p2])
			end,
			initialValue = table.find(RadioButtons, p1.styleName) or 1,
			elementSize = UDim2.new(1, 0, 0, 40)
		})
	}
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: Roact (upval), p1 (copy), config (copy)
		return Roact.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, {
			layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal
			}),
			sideBar = Roact.createElement("Frame", {
				LayoutOrder = 1,
				Size = UDim2.new(0, p1.width, 1, 0),
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color
			}, config),
			viewPort = Roact.createElement("Frame", {
				LayoutOrder = 2,
				Size = UDim2.new(1, -p1.width, 1, 0),
				BackgroundColor3 = Color3.fromRGB(222, 255, 255)
			}, p1[Roact.Children])
		})
	end)
end

local function v12()
	-- upvalues: Rodux (copy)
	return (Rodux.Store.new(function(p1, p2)
		return if p2.type == "receivedStyle" then { style = p2.style } else p1
	end, { style = "Light" }, { Rodux.thunkMiddleware }))
end

local v1 = RoactRodux.connect(function(p1)
	return { styleName = p1.style }
end, function(Callback)
	return {
		updateStyle = function(Style)
			-- upvalues: Callback (copy)
			return Callback({ type = "receivedStyle", style = Style })
		end
	}
end)(function(p1)
	-- upvalues: Roact (copy), UiModeStyleProvider (copy), v11 (copy)
	return Roact.createElement(UiModeStyleProvider, { style = { themeName = p1.styleName } }, {
		viewportWithSidebar = Roact.createElement(v11, {
			width = p1.sideBarWidth,
			updateStyle = p1.updateStyle,
			styleName = p1.styleName
		}, { Story = Roact.createElement(p1.story) })
	})
end)

return function()
	-- upvalues: MockApolloClientFunction (copy), Roact (copy), RoactRodux (copy), v12 (copy), ApolloClientModule (copy), v1 (ref), MockLocaleModule (copy)
	return function(Story, p1)
		-- upvalues: MockApolloClientFunction (upval), Roact (upval), RoactRodux (upval), v12 (upval), ApolloClientModule (upval), v1 (upval), MockLocaleModule (upval)
		local StoryRoot = Roact.mount(MockLocaleModule((Roact.createElement(RoactRodux.StoreProvider, { store = v12() }, {
			Roact.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
				container = Roact.createElement(v1, { sideBarWidth = 100, story = Story })
			})
		}))), p1, "StoryRoot")
		
		return function()
			-- upvalues: Roact (upval), StoryRoot (copy)
			Roact.unmount(StoryRoot)
		end
	end
end