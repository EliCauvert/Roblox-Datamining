local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactTestingLibraryModule = require(Parent1.Dev.ReactTestingLibrary)
local RenderFunction = ReactTestingLibraryModule.render
local Screen = ReactTestingLibraryModule.screen
local MockProvidersModule = require(Parent.TestUtils.mockProviders)

return {
	createTestController = function(p1, p2)
		-- upvalues: MockProvidersModule (copy), ReactModule (copy), RenderFunction (copy), Screen (copy)
		return function(List)
			-- upvalues: p2 (copy), MockProvidersModule (upval), ReactModule (upval), p1 (copy), RenderFunction (upval), Screen (upval)
			local t = {}
			local Copy = table.clone(p2 or {})
			
			if List then
				for i, value in pairs(List) do
					Copy[i] = value
				end
			end
			t.rendered = RenderFunction((MockProvidersModule(ReactModule.createElement(p1, Copy))))
			
			function t.findByTestId(p3)
				-- upvalues: Screen (upval)
				return (Screen.queryByTestId(p3))
			end
			
			return t
		end
	end,
	createPeopleReactViewController = function()
		-- upvalues: Parent (copy), MockProvidersModule (copy), ReactModule (copy), RenderFunction (copy), Screen (copy)
		local PeopleReactViewModule = require(Parent.PeopleReactView)
		local config = { chromeEnabled = true, blockingFlags = {} }
		
		local function v10(List)
			-- upvalues: config (copy), MockProvidersModule (upval), ReactModule (upval), PeopleReactViewModule (copy), RenderFunction (upval), Screen (upval)
			local t = {}
			local Copy = table.clone(config or {})
			
			if List then
				for i, value in pairs(List) do
					Copy[i] = value
				end
			end
			t.rendered = RenderFunction((MockProvidersModule(ReactModule.createElement(PeopleReactViewModule, Copy))))
			
			function t.findByTestId(p3)
				-- upvalues: Screen (upval)
				return (Screen.queryByTestId(p3))
			end
			
			return t
		end
		
		return function()
			-- upvalues: v10 (copy)
			local v1 = v10({})
			local config = { rendered = v1.rendered, findByTestId = v1.findByTestId }
			
			function config.theMainView()
				-- upvalues: config (copy)
				return config.findByTestId("mainView")
			end
			
			function config.thePeopleCards()
				-- upvalues: config (copy)
				return config.findByTestId("peopleCards")
			end
			
			function config.thePeopleList()
				-- upvalues: config (copy)
				return config.findByTestId("peopleList")
			end
			
			function config.theCoreButtonRow()
				-- upvalues: config (copy)
				return config.findByTestId("coreButtonRow")
			end
			
			function config.theMenuButtonsWrapper()
				-- upvalues: config (copy)
				return config.findByTestId("menuButtonsWrapper")
			end
			
			function config.theBlockingModalManager()
				-- upvalues: config (copy)
				return config.findByTestId("blockingModalManager")
			end
			
			function config.hasAllChildComponents(): boolean
				-- upvalues: config (copy)
				config.thePeopleList()
				config.theCoreButtonRow()
				config.theMenuButtonsWrapper()
				config.theBlockingModalManager()
				
				return true
			end
			
			return config
		end
	end
}