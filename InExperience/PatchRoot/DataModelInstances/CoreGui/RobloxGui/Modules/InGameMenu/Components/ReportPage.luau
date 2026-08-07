local playersService = game:GetService("Players")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local pageNavigationWatcherModule = require(parent.Components.PageNavigationWatcher)
local pageModule = require(parent.Components.Page)
local reportListModule = require(script.ReportList)

local function getReportablePlayers() --[[ line: 14 ]]
	-- upvalues: playersService (ref)
	local t = {}
	
	for i, v in ipairs(playersService:GetPlayers()) do
		if v ~= playersService.LocalPlayer then
			table.insert(t, v)
		end
	end
	return t
end

local reportPage = roact.PureComponent:extend("ReportPage")
reportPage.validateProps = t.strictInterface({ pageTitle = t.string })

function reportPage.init(p0) --[[ line: 31 ]]
	-- upvalues: getReportablePlayers (ref)
	p0:setState({ players = getReportablePlayers() })
end

function reportPage.render(p1) --[[ line: 37 ]]
	-- upvalues: roact (ref), pageModule (ref), reportListModule (ref), pageNavigationWatcherModule (ref), getReportablePlayers (ref)
	return roact.createElement(pageModule, { pageTitle = p1.props.pageTitle }, {
		PlayerList = roact.createElement(reportListModule, { players = p1.state.players }),
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "Report",
			onNavigateTo = function() --[[ line: 46 ]]
				-- upvalues: p1 (ref), getReportablePlayers (copy)
				p1:setState({ players = getReportablePlayers() })
			end
		})
	})
end

return reportPage