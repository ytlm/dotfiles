import sublime
import sublime_plugin


# import redis


class ExampleCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in reversed(self.view.find_all('\\\\')):
            self.view.replace(edit, region, '')

        for region in reversed(self.view.find_all('\"{')):
            self.view.replace(edit, region, '{')

        for region in reversed(self.view.find_all('}\"')):
            self.view.replace(edit, region, '}')


        self.view.run_command('pretty_json')

def getRedis():
    r = redis.Redis(host="127.0.0.1", port="6379", db=0, password="foobared")
    return r


class UnexampleCommand(sublime_plugin.TextCommand):
    def run(self, edit):

        self.view.run_command('un_pretty_json')
