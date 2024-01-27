#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int dx[4] = { 1,-1,0,0 };
int dy[4] = { 0,0,1,-1 };
int arr[101][101] = {};
int m, n, k;
int lx, ly, rx, ry;
int cnt = 0;
bool visited[101][101] = { false };

void dfs(int x, int y) {
	visited[x][y] = true;
	cnt++;
	for (int i = 0; i < 4; i++) {
		int nx = x + dx[i];
		int ny = y + dy[i];
		if (nx >= 0 && nx < m && ny >= 0 && ny < n) {
			if (arr[ny][nx] == 0 && !visited[nx][ny]) {
				dfs(nx, ny);
			}
		}
	}
}

int main() {
	cin >> m >> n >> k;
	for (int i = 0; i < k; i++) {
		cin >> lx >> ly >> rx >> ry;
		for (int k = ly; k < ry; k++) {
			for (int j = lx; j < rx; j++) {
				arr[k][j] = 1;//해당 좌표만 1로 표시
			}
		}
	}
	vector<int> area;//영역의 크기 저장
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			if (arr[i][j] == 0&&!visited[i][j]) {
				cnt = 0;
				dfs(i, j);
				area.push_back(cnt);
			}
		}
	}
	sort(area.begin(), area.end());

	cout << area.size() << "\n";
	for (int i = 0; i < area.size(); i++) {
		cout << area[i] << " ";
	}

	return 0;
}
