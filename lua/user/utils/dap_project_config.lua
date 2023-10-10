local M = {}

function M.get_project_name()
    local file = io.open("CMakeLists.txt", "r")
    if not file then
        return nil
    end
    for line in file:lines() do
        local project_name = line:match('project%s*(%b())')
        if project_name then
            file:close()
            return project_name:sub(2, -2)
        end
    end
    file:close()
    return nil
end

function M.find_executable()
    local project_name = M.get_project_name()
    if not project_name then
        return nil
    end
    local executable_path = vim.fn.getcwd() .. '\\build\\' .. project_name .. '.exe'
    if vim.fn.filereadable(executable_path) == 1 then
        return executable_path
    end
    return nil
end

return M

