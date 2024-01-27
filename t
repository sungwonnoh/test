#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};
int arr[101][101] = {};
int m, n, k;
int lx, ly, rx, ry;
int cnt = 0;
bool visited[101][101] = {false};

// DFS 함수
void dfs(int x, int y) {
    visited[x][y] = true;
    cnt++;
    for (int i = 0; i < 4; i++) {
        int nx = x + dx[i];
        int ny = y + dy[i];
        if (nx >= 0 && nx < m && ny >= 0 && ny < n) {
            if (arr[nx][ny] == 0 && !visited[nx][ny]) {
                dfs(nx, ny);
            }
        }
    }
}

int main() {
    cin >> m >> n >> k;

    // 직사각형의 좌표를 입력받아 해당 영역을 1로 표시
    for (int i = 0; i < k; i++) {
        cin >> lx >> ly >> rx >> ry;
        for (int j = ly; j < ry; j++) {
            for (int k = lx; k < rx; k++) {
                arr[j][k] = 1;
            }
        }
    }

    vector<int> area; // 각 영역의 크기를 저장할 벡터

    // 배열을 탐색하여 0으로 표시된 지점에서 DFS를 수행하고 각 영역의 크기를 저장
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (arr[i][j] == 0 && !visited[i][j]) {
                cnt = 0;
                dfs(i, j);
                area.push_back(cnt); // 각 영역의 크기를 벡터에 추가
            }
        }
    }

    sort(area.begin(), area.end()); // 영역의 크기를 정렬

    // 결과 출력
    cout << area.size() << "\n"; // 영역의 개수 출력
    for (int i = 0; i < area.size(); i++) {
        cout << area[i] << " "; // 각 영역의 크기 출력
    }

    return 0;
}
